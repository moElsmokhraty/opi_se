import 'package:equatable/equatable.dart';
import '../login_models/login_response/user_skill.dart';
import 'user_question.dart';

class UserPrefersRequest extends Equatable {
  final String? fieldOfStudy;
  final String? specialization;
  final List<UserQuestion>? userQuestions;
  final List<Skill>? userSkills;

  const UserPrefersRequest({
    this.fieldOfStudy,
    this.specialization,
    this.userQuestions,
    this.userSkills,
  });

  factory UserPrefersRequest.fromJson(Map<String, dynamic> json) {
    return UserPrefersRequest(
      fieldOfStudy: json['fieldOfStudy'] as String?,
      specialization: json['specialization'] as String?,
      userQuestions: (json['userQuestions'] as List<dynamic>?)
          ?.map((e) => UserQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      userSkills: (json['userSkills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'fieldOfStudy': fieldOfStudy,
        'specialization': specialization,
        'userQuestions': [],
        'userSkills': userSkills?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      fieldOfStudy,
      specialization,
      userQuestions,
      userSkills,
    ];
  }
}
