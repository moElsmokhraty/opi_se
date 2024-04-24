import 'package:equatable/equatable.dart';

class EditTaskRequest extends Equatable {
  final String? title;
  final String? content;
  final String? startDate;
  final String? endDate;
  final String? taskStatus;

  const EditTaskRequest({
    this.title,
    this.content,
    this.startDate,
    this.endDate,
    this.taskStatus,
  });

  factory EditTaskRequest.fromJson(Map<String, dynamic> json) {
    return EditTaskRequest(
      title: json['title'] as String?,
      content: json['content'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      taskStatus: json['taskStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'startDate': startDate,
        'endDate': endDate,
        'taskStatus': taskStatus,
      };

  @override
  List<Object?> get props {
    return [
      title,
      content,
      startDate,
      endDate,
      taskStatus,
    ];
  }
}
