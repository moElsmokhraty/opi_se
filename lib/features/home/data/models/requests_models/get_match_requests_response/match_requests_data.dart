import 'package:equatable/equatable.dart';

import 'partner_request.dart';

class MatchRequestsData extends Equatable {
  final String? id;
  final List<PartnerRequest>? partnerRequests;

  const MatchRequestsData({this.id, this.partnerRequests});

  factory MatchRequestsData.fromJson(Map<String, dynamic> json) =>
      MatchRequestsData(
        id: json['_id'] as String?,
        partnerRequests: (json['partnerRequests'] as List<dynamic>?)
            ?.map((e) => PartnerRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'partnerRequests': partnerRequests?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, partnerRequests];
}
