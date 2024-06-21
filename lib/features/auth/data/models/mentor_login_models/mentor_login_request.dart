import 'package:equatable/equatable.dart';

class MentorLoginRequest extends Equatable {
  final String? userName;
  final String? password;
  final String? deviceToken;

  const MentorLoginRequest({
    this.userName,
    this.password,
    this.deviceToken,
  });

  factory MentorLoginRequest.fromJson(Map<String, dynamic> json) {
    return MentorLoginRequest(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      deviceToken: json['deviceToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
        'deviceToken': deviceToken,
      };

  @override
  List<Object?> get props => [userName, password, deviceToken];
}
