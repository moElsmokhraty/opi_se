import 'package:equatable/equatable.dart';

import 'user_data.dart';

class LoginResponse extends Equatable {
  final String? message;
  final String? token;
  final UserData? data;
  final bool? firstTime;

  const LoginResponse({
    this.message,
    this.token,
    this.data,
    this.firstTime,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        token: json['token'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
        firstTime: json['firstTime'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
        'data': data?.toJson(),
        'firstTime': firstTime,
      };

  @override
  List<Object?> get props => [message, token, data, firstTime];
}
