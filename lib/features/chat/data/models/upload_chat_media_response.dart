import 'package:equatable/equatable.dart';

class UploadChatMediaResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List? links;

  const UploadChatMediaResponse({
    this.success,
    this.statusCode,
    this.message,
    this.links,
  });

  factory UploadChatMediaResponse.fromJson(Map<String, dynamic> json) {
    return UploadChatMediaResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      links: json['data'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
        'data': links,
      };

  @override
  List<Object?> get props => [success, statusCode, message, links];
}
