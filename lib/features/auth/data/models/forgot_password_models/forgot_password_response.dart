import 'package:equatable/equatable.dart';

class ForgotPasswordResponse extends Equatable {
  final String? message;

  const ForgotPasswordResponse({this.message});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
