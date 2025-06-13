import 'package:api/core/api/end_points.dart';

class ErrorModel {
  final int? status;
  final String errMessage;

  ErrorModel({
    required this.status,
    required this.errMessage,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errMessage: jsonData[ApiKey.errMessage],
    );
  }
}
