import 'package:equatable/equatable.dart';

class VerifyOtpRequest extends Equatable {
  final String? email;
  final String? otpCode;

  const VerifyOtpRequest({this.email, this.otpCode});

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      email: json['email'] as String?,
      otpCode: json['otpCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'otpCode': otpCode,
      };

  @override
  List<Object?> get props => [email, otpCode];
}
