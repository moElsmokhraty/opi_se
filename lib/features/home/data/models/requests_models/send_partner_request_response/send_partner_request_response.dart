import 'package:equatable/equatable.dart';

import 'notified_partner.dart';

class SendPartnerRequestResponse extends Equatable {
  final String? message;
  final NotifiedPartner? notifiedPartner;

  const SendPartnerRequestResponse({this.message, this.notifiedPartner});

  factory SendPartnerRequestResponse.fromJson(Map<String, dynamic> json) {
    return SendPartnerRequestResponse(
      message: json['message'] as String?,
      notifiedPartner: json['data'] == null
          ? null
          : NotifiedPartner.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': notifiedPartner?.toJson(),
      };

  @override
  List<Object?> get props => [message, notifiedPartner];
}
