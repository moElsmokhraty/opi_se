import 'package:equatable/equatable.dart';

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
        '_id': id,
      };

  @override
  List<Object?> get props => [languageName, level, id];
}
