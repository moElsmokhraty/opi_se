import 'package:equatable/equatable.dart';

import 'experience.dart';
import 'language.dart';
import 'skill.dart';

class MentorRegisterRequest extends Equatable {
  final String? userName;
  final String? email;
  final int? age;
  final String? gender;
  final String? location;
  final String? nationalId;
  final String? password;
  final String? confirmPassword;
  final String? bio;
  final String? fieldOfStudy;
  final String? specialization;
  final List<Language>? languages;
  final List<Skill>? skills;
  final List<Experience>? experience;

  const MentorRegisterRequest({
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.location,
    this.nationalId,
    this.password,
    this.confirmPassword,
    this.bio,
    this.fieldOfStudy,
    this.specialization,
    this.languages,
    this.skills,
    this.experience,
  });

  factory MentorRegisterRequest.fromJson(Map<String, dynamic> json) {
    return MentorRegisterRequest(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      location: json['location'] as String?,
      nationalId: json['nationalId'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
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
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'age': age,
        'gender': gender,
        'location': location,
        'nationalId': nationalId,
        'password': password,
        'confirmPassword': confirmPassword,
        'bio': bio,
        'fieldOfStudy': fieldOfStudy,
        'specialization': specialization,
        'languages': languages?.map((e) => e.toJson()).toList(),
        'skills': skills?.map((e) => e.toJson()).toList(),
        'experience': experience?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      userName,
      email,
      age,
      gender,
      location,
      nationalId,
      password,
      confirmPassword,
      bio,
      fieldOfStudy,
      specialization,
      languages,
      skills,
      experience,
    ];
  }
}
