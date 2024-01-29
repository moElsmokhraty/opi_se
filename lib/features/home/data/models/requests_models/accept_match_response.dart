import 'package:equatable/equatable.dart';

class AcceptMatchResponse extends Equatable {
  final String? message;
  final String? acceptedPartner;
  final String? notifiedPartner;
  final String? matchId;

  const AcceptMatchResponse({
    this.message,
    this.acceptedPartner,
    this.notifiedPartner,
    this.matchId,
  });

  factory AcceptMatchResponse.fromJson(Map<String, dynamic> json) {
    return AcceptMatchResponse(
      message: json['message'] as String?,
      acceptedPartner: json['acceptedPartner'] as String?,
      notifiedPartner: json['notifiedPartner'] as String?,
      matchId: json['matchId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'acceptedPartner': acceptedPartner,
        'notifiedPartner': notifiedPartner,
        'matchId': matchId,
      };

  @override
  List<Object?> get props {
    return [
      message,
      acceptedPartner,
      notifiedPartner,
      matchId,
    ];
  }
}
