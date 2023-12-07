import 'package:equatable/equatable.dart';

class UserPrefersResponse extends Equatable {
  final String? message;
  final String? error;

  const UserPrefersResponse({
    this.message,
    this.error,
  });

  factory UserPrefersResponse.fromJson(Map<String, dynamic> json) {
    return UserPrefersResponse(
      message: json['message'] as String?,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'error': error,
      };

  @override
  List<Object?> get props => [message, error];
}
