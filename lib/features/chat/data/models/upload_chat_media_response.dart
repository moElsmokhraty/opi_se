import 'package:equatable/equatable.dart';

class UploadChatMediaResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final List<String>? links;

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
      links: json['data'] != null
          ? List<String>.from(json['data'].map((x) => x as String))
          : null,
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
