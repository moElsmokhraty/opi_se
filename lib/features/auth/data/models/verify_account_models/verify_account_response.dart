import 'package:equatable/equatable.dart';

class VerifyAccountResponse extends Equatable {
  final String? message;

  const VerifyAccountResponse({this.message});

  factory VerifyAccountResponse.fromJson(Map<String, dynamic> json) {
    return VerifyAccountResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };

  @override
  List<Object?> get props => [message];
}
