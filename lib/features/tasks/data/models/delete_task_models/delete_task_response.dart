import 'package:equatable/equatable.dart';
import '../task.dart';

class DeleteTaskResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Task? task;

  const DeleteTaskResponse({
    this.success,
    this.statusCode,
    this.message,
    this.task,
  });

  factory DeleteTaskResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTaskResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      task: json['data'] == null
          ? null
          : Task.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
        'data': task?.toJson(),
      };

  @override
  List<Object?> get props => [success, statusCode, message, task];
}
