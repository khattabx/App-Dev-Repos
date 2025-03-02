import 'package:api/cache/cache_helper.dart';
import 'package:api/core/api/api_consumer.dart';
import 'package:api/core/api/end_points.dart';
import 'package:api/core/errors/exceptions.dart';
import 'package:api/core/functions/upload_image_to_api.dart';
import 'package:api/models/sign_in_model.dart';
import 'package:api/models/sign_up_model.dart';
import 'package:api/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepo {
  final ApiConsumer api;

  UserRepo({required this.api});
  Future<Either<String, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await api.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.errMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoints.signUp,
        isFormData: true,
        data: {
          ApiKey.name: name,
          ApiKey.phone: phone,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.profilePic: await uploadImageToApi(profilePic),
          ApiKey.location:
              '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        },
      );
      final signUpModel = SignUpModel.fromJson(response);
      return Right(signUpModel);
    } on ServerExceptions catch (e) {
      return left(e.errorModel.errMessage);
    }
  }

  Future<Either<String, UserModel>> getUserprofile() async {
    try {
      final response = await api.get(
        EndPoints.getUserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerExceptions catch (e) {
      return Left(e.errorModel.errMessage);
    }
  }
}
