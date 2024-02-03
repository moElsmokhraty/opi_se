import 'package:equatable/equatable.dart';

class EditNoteRequest extends Equatable {
  final String? noteId;
  final String? noteTitle;
  final String? noteContent;
  final String? noteColor;

  const EditNoteRequest({
    this.noteId,
    this.noteTitle,
    this.noteContent,
    this.noteColor,
  });

  factory EditNoteRequest.fromJson(Map<String, dynamic> json) {
    return EditNoteRequest(
      noteId: json['noteId'] as String?,
      noteTitle: json['noteTitle'] as String?,
      noteContent: json['noteContent'] as String?,
      noteColor: json['noteColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'noteTitle': noteTitle,
        'noteContent': noteContent,
        'noteColor': noteColor,
      };

  @override
  List<Object?> get props => [
        noteId,
        noteTitle,
        noteContent,
        noteColor,
      ];
}
