import 'package:equatable/equatable.dart';

class UserSkill extends Equatable {
  final String? skillName;
  final int? skillRate;

  const UserSkill({this.skillName, this.skillRate});

  factory UserSkill.fromJson(Map<String, dynamic> json) => UserSkill(
        skillName: json['skillName'] as String?,
        skillRate: json['skillRate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'skillName': skillName,
        'skillRate': skillRate,
      };

  @override
  List<Object?> get props => [skillName, skillRate];
}
