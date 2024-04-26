import 'package:textoit/core/error/error_core.dart';

class ErrorModelCore extends Failure {
  String? status;
  String? message;
  ErrorModelCore({this.status, this.message});

  factory ErrorModelCore.fromJson(Map<String, dynamic> json) => ErrorModelCore(
        status: json['status'],
        message: json['message'],
      );

  factory ErrorModelCore.empty() {
    return ErrorModelCore(
      status: '',
      message: '',
    );
  }
}
