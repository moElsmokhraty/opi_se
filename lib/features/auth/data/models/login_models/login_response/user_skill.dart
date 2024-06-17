import 'package:hive/hive.dart';

part 'user_skill.g.dart';

@HiveType(typeId: 2)
//ignore: must_be_immutable
class Skill extends HiveObject {
  @HiveField(0)
  String? skillName;
  @HiveField(1)
  int? skillRate;
  @HiveField(2)
  String? id;

  Skill({this.skillName, this.skillRate, this.id});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        skillName: json['skillName'] as String?,
        skillRate: json['skillRate'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'skillName': skillName,
        'skillRate': skillRate,
        '_id': id,
      };
}
