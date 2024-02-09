import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 3)
class Language extends Equatable {
  final String? languageName;
  final int? level;
  final String? id;

  const Language({this.languageName, this.level, this.id});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageName: json['languageName'] as String?,
        level: json['level'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'languageName': languageName,
        'level': level,
      };

  @override
  List<Object?> get props => [languageName, level, id];
}
