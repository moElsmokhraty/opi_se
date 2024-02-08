import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_skill.g.dart';

@HiveType(typeId: 2)
class UserSkill extends Equatable {
  final String? skillName;
  final int? skillRate;
  final String? id;

  const UserSkill({this.skillName, this.skillRate, this.id});

  factory UserSkill.fromJson(Map<String, dynamic> json) => UserSkill(
        skillName: json['skillName'] as String?,
        skillRate: json['skillRate'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'skillName': skillName,
        'skillRate': skillRate,
      };

  @override
  List<Object?> get props => [skillName, skillRate, id];
}
