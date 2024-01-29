import 'package:equatable/equatable.dart';

class DeclineMatchResponse extends Equatable {
  final String? message;
  final String? error;

  const DeclineMatchResponse({this.message, this.error});

  factory DeclineMatchResponse.fromJson(Map<String, dynamic> json) {
    return DeclineMatchResponse(
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
