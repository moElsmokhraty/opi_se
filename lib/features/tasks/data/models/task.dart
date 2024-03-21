import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? title;
  final String? content;
  final String? addedBy;
  final String? matchId;
  final String? taskStatus;
  final DateTime? createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? id;
  final int? v;

  const Task({
    this.title,
    this.content,
    this.addedBy,
    this.matchId,
    this.taskStatus,
    this.createdAt,
    this.startDate,
    this.endDate,
    this.id,
    this.v,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'] as String?,
        content: json['content'] as String?,
        addedBy: json['addedBy'] as String?,
        matchId: json['matchId'] as String?,
        taskStatus: json['taskStatus'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        startDate: json['startDate'] == null
            ? null
            : DateTime.parse(json['startDate'] as String),
        endDate: json['endDate'] == null
            ? null
            : DateTime.parse(json['endDate'] as String),
        id: json['_id'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'addedBy': addedBy,
        'matchId': matchId,
        'taskStatus': taskStatus,
        'createdAt': createdAt?.toIso8601String(),
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        '_id': id,
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      title,
      content,
      addedBy,
      matchId,
      taskStatus,
      createdAt,
      startDate,
      endDate,
      id,
      v,
    ];
  }
}
