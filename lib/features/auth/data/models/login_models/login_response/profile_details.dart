import 'package:equatable/equatable.dart';

import 'user_skill.dart';

class ProfileDetails extends Equatable {
  final String? id;
  final String? fieldOfStudy;
  final String? specialization;
  final List<Skill>? userSkills;

  const ProfileDetails({
    this.id,
    this.fieldOfStudy,
    this.specialization,
    this.userSkills,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
      id: json['_id'] as String?,
      fieldOfStudy: json['fieldOfStudy'] as String?,
      specialization: json['specialization'] as String?,
      userSkills: (json['userSkills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fieldOfStudy': fieldOfStudy,
        'specialization': specialization,
        'userSkills': userSkills?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      fieldOfStudy,
      specialization,
      userSkills,
    ];
  }
}
