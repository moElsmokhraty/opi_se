import 'package:equatable/equatable.dart';
import '../task.dart';

class AddTaskResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Task? data;

  const AddTaskResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AddTaskResponse.fromJson(Map<String, dynamic> json) {
    return AddTaskResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Task.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [success, statusCode, message, data];
}
