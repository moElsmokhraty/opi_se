import 'package:equatable/equatable.dart';

class AddNoteRequest extends Equatable {
  final String? noteTitle;
  final String? noteContent;
  final String? noteColor;

  const AddNoteRequest({this.noteTitle, this.noteContent, this.noteColor});

  factory AddNoteRequest.fromJson(Map<String, dynamic> json) {
    return AddNoteRequest(
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
  List<Object?> get props => [noteTitle, noteContent, noteColor];
}
