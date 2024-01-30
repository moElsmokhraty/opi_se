import 'package:equatable/equatable.dart';
import 'language.dart';
import 'notification.dart';
import '../../../../../home/data/models/requests_models/get_match_requests_response/partner_request.dart';

class UserData extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final int? age;
  final String? gender;
  final String? location;
  final String? nationalId;
  final String? profileImage;
  final bool? isVerified;
  final int? numOfReports;
  final dynamic partnerId;
  final dynamic matchId;
  final bool? isAvailable;
  final DateTime? joinedAt;
  final List<Language>? languages;
  final List<PartnerRequest>? partnerRequests;
  final List<dynamic>? history;
  final List<Notification>? notifications;
  final int? v;

  const UserData({
    this.id,
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.profileImage,
    this.isVerified,
    this.numOfReports,
    this.partnerId,
    this.matchId,
    this.isAvailable,
    this.joinedAt,
    this.languages,
    this.partnerRequests,
    this.history,
    this.v,
    this.notifications,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        age: json['age'] as int?,
        gender: json['gender'] as String?,
        location: json['location'] as String?,
        nationalId: json['nationalId'] as String?,
        profileImage: json['profileImage'] as String?,
        isVerified: json['isVerified'] as bool?,
        numOfReports: json['numOfReports'] as int?,
        partnerId: json['partnerId'] as dynamic,
        matchId: json['matchId'] as dynamic,
        isAvailable: json['isAvailable'] as bool?,
        joinedAt: json['joinedAt'] == null
            ? null
            : DateTime.parse(json['joinedAt'] as String),
        languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        notifications: (json['notifications'] as List<dynamic>?)
            ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
            .toList(),
        partnerRequests: (json['partnerRequests'] as List<dynamic>?)
            ?.map((e) => PartnerRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
        history: json['history'] as List<dynamic>?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userName': userName,
        'email': email,
        'age': age,
        'gender': gender,
        'location': location,
        'nationalId': nationalId,
        'profileImage': profileImage,
        'isVerified': isVerified,
        'numOfReports': numOfReports,
        'partnerId': partnerId,
        'matchId': matchId,
        'isAvailable': isAvailable,
        'joinedAt': joinedAt?.toIso8601String(),
        'languages': languages?.map((e) => e.toJson()).toList(),
        'partnerRequests': partnerRequests,
        'history': history,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userName,
      email,
      age,
      gender,
      location,
      nationalId,
      profileImage,
      isVerified,
      numOfReports,
      partnerId,
      matchId,
      isAvailable,
      joinedAt,
      languages,
      partnerRequests,
      history,
      v,
    ];
  }
}
