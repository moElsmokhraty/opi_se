import 'package:equatable/equatable.dart';

class DeclineMatchRequest extends Equatable {
  final String? rejectedUserId;
  final String? email;
  final String? requestId;

  const DeclineMatchRequest({
    this.rejectedUserId,
    this.email,
    this.requestId,
  });

  factory DeclineMatchRequest.fromJson(Map<String, dynamic> json) {
    return DeclineMatchRequest(
      rejectedUserId: json['rejectedUserId'] as String?,
      email: json['email'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'rejectedUserId': rejectedUserId,
        'email': email,
        'requestId': requestId,
      };

  @override
  List<Object?> get props => [rejectedUserId, email, requestId];
}
