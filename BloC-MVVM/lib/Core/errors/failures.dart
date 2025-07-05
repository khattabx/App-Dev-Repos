import 'package:dio/dio.dart';
abstract class Failures {
  final String errMessage;
  Failures(
    this.errMessage,
  );
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
      default:
        return ServerFailure(
            'Oops! Something went wrong, please try again later!');
    }
    return ServerFailure('Unexpected error, please try again');
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          'your request not be processed, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, please try again later!');
    } else {
      return ServerFailure(
          'Oops! Something went wrong, please try again later!');
    }
  }
}
