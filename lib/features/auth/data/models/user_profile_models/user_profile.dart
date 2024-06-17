import 'package:equatable/equatable.dart';
import '../login_models/login_response/language.dart';
import '../login_models/login_response/partner.dart';
import 'match_id.dart';
import 'profile_details.dart';

class UserProfile extends Equatable {
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
  final MatchId? matchId;
  final bool? isAvailable;
  final DateTime? joinedAt;
  final bool? getUserPrefers;
  final int? points;
  final String? bio;
  final List<Language>? languages;
  final int? v;
  final ProfileDetails? profileDetails;

  const UserProfile({
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
    this.getUserPrefers,
    this.points,
    this.bio,
    this.languages,
    this.v,
    this.profileDetails,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
        partner: json['partnerId'] == null
            ? null
            : Partner.fromJson(json['partnerId'] as Map<String, dynamic>),
        matchId: json['matchId'] == null
            ? null
            : MatchId.fromJson(json['matchId'] as Map<String, dynamic>),
        isAvailable: json['isAvailable'] as bool?,
        joinedAt: json['joinedAt'] == null
            ? null
            : DateTime.parse(json['joinedAt'] as String),
        getUserPrefers: json['getUserPrefers'] as bool?,
        points: json['points'] as int?,
        bio: json['bio'] as String?,
        languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        v: json['__v'] as int?,
        profileDetails: json['profileDetails'] == null
            ? null
            : ProfileDetails.fromJson(
                json['profileDetails'] as Map<String, dynamic>),
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
        'matchId': matchId?.toJson(),
        'isAvailable': isAvailable,
        'joinedAt': joinedAt?.toIso8601String(),
        'getUserPrefers': getUserPrefers,
        'points': points,
        'bio': bio,
        'languages': languages?.map((e) => e.toJson()).toList(),
        '__v': v,
        'profileDetails': profileDetails?.toJson(),
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
      points,
      bio,
      languages,
      v,
      profileDetails,
    ];
  }
}
