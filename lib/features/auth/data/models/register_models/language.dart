import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String? languageName;
  final int? level;

  const Language({this.languageName, this.level});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        languageName: json['languageName'] as String?,
        level: json['level'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'languageName': languageName,
        'level': level,
      };

  @override
  List<Object?> get props => [languageName, level];
}
