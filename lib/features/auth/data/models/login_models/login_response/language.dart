import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 3)
//ignore: must_be_immutable

class Language extends HiveObject {
  @HiveField(0)
  String? languageName;
  @HiveField(1)
  int? level;
  @HiveField(2)
  String? id;

  Language({this.languageName, this.level, this.id});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageName: json['languageName'] as String?,
        level: json['level'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'languageName': languageName,
        'level': level,
        '_id': id,
      };
}
