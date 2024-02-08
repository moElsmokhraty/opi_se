import 'package:equatable/equatable.dart';
import 'partner.dart';
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
  final Partner? partner;
  final String? matchId;
  final bool? isAvailable;
  final DateTime? joinedAt;
  final List<Language>? languages;
  final bool? getUserPrefers;
  final List<PartnerRequest>? partnerRequests;
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
    this.partner,
    this.matchId,
    this.isAvailable,
    this.joinedAt,
    this.languages,
    this.getUserPrefers,
    this.partnerRequests,
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
        partner: json['partnerID'] == null
            ? null
            : Partner.fromJson(json['partnerId'] as Map<String, dynamic>),
        matchId: json['matchId'] as String?,
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
        getUserPrefers: json['getUserPrefers'] as bool?,
        partnerRequests: (json['partnerRequests'] as List<dynamic>?)
            ?.map((e) => PartnerRequest.fromJson(e as Map<String, dynamic>))
            .toList(),
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
        'partnerId': partner?.toJson(),
        'matchId': matchId,
        'isAvailable': isAvailable,
        'joinedAt': joinedAt?.toIso8601String(),
        'getUserPrefers': getUserPrefers,
        'languages': languages?.map((e) => e.toJson()).toList(),
        'partnerRequests': partnerRequests,
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
      partner,
      matchId,
      isAvailable,
      joinedAt,
      getUserPrefers,
      languages,
      partnerRequests,
      v,
    ];
  }
}
