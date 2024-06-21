import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String? skillName;
  final String? skillRate;

  const Skill({this.skillName, this.skillRate});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skillName: json['skillName'] as String?,
        skillRate: json['skillRate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'skillName': skillName,
        'skillRate': skillRate,
      };

  @override
  List<Object?> get props => [skillName, skillRate];
}
