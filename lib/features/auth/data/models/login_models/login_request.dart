import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  final String? userName;
  final String? password;
  final String? deviceToken;

  const LoginRequest({this.userName, this.password, this.deviceToken});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        userName: json['userName'] as String?,
        password: json['password'] as String?,
        deviceToken: json['deviceToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'deviceToken': deviceToken,
      };

  @override
  List<Object?> get props => [userName, password, deviceToken];
}
