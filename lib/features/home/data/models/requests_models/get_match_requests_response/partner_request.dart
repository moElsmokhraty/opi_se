import 'package:equatable/equatable.dart';

class PartnerRequest extends Equatable {
  final String? partnerId;
  final String? nationalId;
  final String? partnerUserName;
  final String? requestStatus;
  final String? id;

  const PartnerRequest({
    this.partnerId,
    this.nationalId,
    this.partnerUserName,
    this.requestStatus,
    this.id,
  });

  factory PartnerRequest.fromJson(Map<String, dynamic> json) {
    return PartnerRequest(
      partnerId: json['partnerId'] as String?,
      nationalId: json['nationalId'] as String?,
      partnerUserName: json['partnerUserName'] as String?,
      requestStatus: json['requestStatus'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'partnerId': partnerId,
        'nationalId': nationalId,
        'partnerUserName': partnerUserName,
        'requestStatus': requestStatus,
        '_id': id,
      };

  @override
  List<Object?> get props {
    return [
      partnerId,
      nationalId,
      partnerUserName,
      requestStatus,
      id,
    ];
  }
}
