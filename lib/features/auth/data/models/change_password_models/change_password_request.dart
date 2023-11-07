import 'package:equatable/equatable.dart';

class ChangePasswordRequest extends Equatable {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  const ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequest(
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
      confirmNewPassword: json['confirmNewPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmNewPassword': confirmNewPassword,
      };

  @override
  List<Object?> get props {
    return [
      oldPassword,
      newPassword,
      confirmNewPassword,
    ];
  }
}
