import 'package:equatable/equatable.dart';
import 'experience.dart';
import '../../login_models/login_response/language.dart';
import '../../login_models/login_response/user_skill.dart';

class MentorData extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final int? age;
  final String? gender;
  final String? location;
  final String? nationalId;
  final String? profileImage;
  final bool? isVerified;
  final String? otpCode;
  final bool? isApproved;
  final int? numOfReports;
  final DateTime? joinedAt;
  final String? bio;
  final String? fieldOfStudy;
  final String? specialization;
  final List<Language>? languages;
  final List<Skill>? skills;
  final List<Experience>? experience;
  final List<dynamic>? certificates;
  final int? points;
  final String? role;
  final List<dynamic>? mentorRequests;
  final int? v;

  const MentorData({
    this.id,
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.profileImage,
    this.isVerified,
    this.otpCode,
    this.isApproved,
    this.numOfReports,
    this.joinedAt,
    this.bio,
    this.fieldOfStudy,
    this.specialization,
    this.languages,
    this.skills,
    this.experience,
    this.certificates,
    this.points,
    this.role,
    this.mentorRequests,
    this.v,
  });

  factory MentorData.fromJson(Map<String, dynamic> json) => MentorData(
        id: json['_id'] as String?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        age: json['age'] as int?,
        gender: json['gender'] as String?,
        location: json['location'] as String?,
        nationalId: json['nationalId'] as String?,
        profileImage: json['profileImage'] as String?,
        isVerified: json['isVerified'] as bool?,
        otpCode: json['otpCode'] as String?,
        isApproved: json['isApproved'] as bool?,
        numOfReports: json['numOfReports'] as int?,
        joinedAt: json['joinedAt'] == null
            ? null
            : DateTime.parse(json['joinedAt'] as String),
        bio: json['bio'] as String?,
        fieldOfStudy: json['fieldOfStudy'] as String?,
        specialization: json['specialization'] as String?,
        languages: (json['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
            .toList(),
        skills: (json['skills'] as List<dynamic>?)
            ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
            .toList(),
        experience: (json['experience'] as List<dynamic>?)
            ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
            .toList(),
        certificates: json['certificates'] as List<dynamic>?,
        points: json['points'] as int?,
        role: json['role'] as String?,
        mentorRequests: json['mentorRequests'] as List<dynamic>?,
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
        'otpCode': otpCode,
        'isApproved': isApproved,
        'numOfReports': numOfReports,
        'joinedAt': joinedAt?.toIso8601String(),
        'bio': bio,
        'fieldOfStudy': fieldOfStudy,
        'specialization': specialization,
        'languages': languages?.map((e) => e.toJson()).toList(),
        'skills': skills?.map((e) => e.toJson()).toList(),
        'experience': experience?.map((e) => e.toJson()).toList(),
        'certificates': certificates,
        'points': points,
        'role': role,
        'mentorRequests': mentorRequests,
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
      otpCode,
      isApproved,
      numOfReports,
      joinedAt,
      bio,
      fieldOfStudy,
      specialization,
      languages,
      skills,
      experience,
      certificates,
      points,
      role,
      mentorRequests,
      v,
    ];
  }
}
