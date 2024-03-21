import 'package:equatable/equatable.dart';

class DeleteAllTasksTypeResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;

  const DeleteAllTasksTypeResponse({
    this.success,
    this.statusCode,
    this.message,
  });

  factory DeleteAllTasksTypeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAllTasksTypeResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
      };

  @override
  List<Object?> get props => [success, statusCode, message];
}
