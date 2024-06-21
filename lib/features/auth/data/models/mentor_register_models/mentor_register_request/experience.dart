import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final String? title;
  final String? employmentType;
  final String? companyName;
  final String? startDate;
  final String? endDate;

  const Experience({
    this.title,
    this.employmentType,
    this.companyName,
    this.startDate,
    this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        title: json['title'] as String?,
        employmentType: json['employmentType'] as String?,
        companyName: json['companyName'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'employmentType': employmentType,
        'companyName': companyName,
        'startDate': startDate,
        'endDate': endDate,
      };

  @override
  List<Object?> get props {
    return [
      title,
      employmentType,
      companyName,
      startDate,
      endDate,
    ];
  }
}
