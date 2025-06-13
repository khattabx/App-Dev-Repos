import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToApi(XFile image) async {
  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
  );
}
