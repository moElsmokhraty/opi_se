import 'package:equatable/equatable.dart';
import 'skill.dart';
import 'language.dart';
import 'experience.dart';

class MentorRegisterRequest extends Equatable {
  final String? userName;
  final String? email;
  final int? age;
  final String? gender;
  final String? location;
  final String? nationalId;
  final String? password;
  final String? confirmPassword;
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
    this.fieldOfStudy,
    this.specialization,
    this.languages,
    this.skills,
    this.experience,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'age': age,
        'gender': gender,
        'location': location,
        'nationalId': nationalId,
        'password': password,
        'confirmPassword': confirmPassword,
        'bio': 'blank',
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
      fieldOfStudy,
      specialization,
      languages,
      skills,
      experience,
    ];
  }
}
