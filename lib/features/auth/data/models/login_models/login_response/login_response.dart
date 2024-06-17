import 'package:equatable/equatable.dart';

import 'user_data.dart';
import 'profile_details.dart';

class LoginResponse extends Equatable {
  final String? message;
  final String? token;
  final UserData? data;
  final ProfileDetails? profileDetails;

  const LoginResponse({
    this.message,
    this.token,
    this.data,
    this.profileDetails,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
        profileDetails: json['profileDetails'] == null
            ? null
            : ProfileDetails.fromJson(
                json['profileDetails'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'data': data?.toJson(),
        'profileDetails': profileDetails?.toJson(),
      };

  @override
  List<Object?> get props => [message, token, data, profileDetails];
}
