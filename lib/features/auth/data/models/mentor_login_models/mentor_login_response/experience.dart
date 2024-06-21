import 'package:hive/hive.dart';

part 'experience.g.dart';

@HiveType(typeId: 5)
class Experience extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? employmentType;
  @HiveField(2)
  final String? companyName;
  @HiveField(3)
  final DateTime? startDate;
  @HiveField(4)
  final DateTime? endDate;
  @HiveField(5)
  final String? id;

  Experience({
    this.title,
    this.employmentType,
    this.companyName,
    this.startDate,
    this.endDate,
    this.id,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        title: json['title'] as String?,
        employmentType: json['employmentType'] as String?,
        companyName: json['companyName'] as String?,
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'employmentType': employmentType,
        'companyName': companyName,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        '_id': id,
      };
}
