import 'package:equatable/equatable.dart';

class AddTaskRequest extends Equatable {
  final String? title;
  final String? content;
  final String? startDate;
  final String? endDate;

  const AddTaskRequest({
    this.title,
    this.content,
    this.startDate,
    this.endDate,
  });

  factory AddTaskRequest.fromJson(Map<String, dynamic> json) {
    return AddTaskRequest(
      title: json['title'] as String?,
      content: json['content'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'startDate': startDate,
        'endDate': endDate,
      };

  @override
  List<Object?> get props => [title, content, startDate, endDate];
}
