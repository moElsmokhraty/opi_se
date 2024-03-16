import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String? id;
  final String? userId;
  final String? matchId;
  final String? noteTitle;
  final String? noteContent;
  bool? isPinned;
  final String? noteColor;
  final DateTime? createdAt;
  final int? v;

  Note({
    this.id,
    this.userId,
    this.matchId,
    this.noteTitle,
    this.noteContent,
    this.isPinned,
    this.noteColor,
    this.createdAt,
    this.v,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['_id'] as String?,
        userId: json['userId'] as String?,
        matchId: json['matchId'] as String?,
        noteTitle: json['noteTitle'] as String?,
        noteContent: json['noteContent'] as String?,
        isPinned: json['isPinned'] as bool?,
        noteColor: json['noteColor'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'matchId': matchId,
        'noteTitle': noteTitle,
        'noteContent': noteContent,
        'isPinned': isPinned,
        'noteColor': noteColor,
        'createdAt': createdAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      matchId,
      noteTitle,
      noteContent,
      isPinned,
      noteColor,
      createdAt,
      v,
    ];
  }
}
