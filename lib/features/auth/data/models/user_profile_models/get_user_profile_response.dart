import 'package:equatable/equatable.dart';

import 'user_profile.dart';

class GetUserProfileResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final UserProfile? data;

  const GetUserProfileResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetUserProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetUserProfileResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserProfile.fromJson(json['data'] as Map<String, dynamic>),
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
