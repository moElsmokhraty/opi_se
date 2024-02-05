import 'package:equatable/equatable.dart';
import '../get_all_notes_response/note.dart';

class RestoreNoteResponse extends Equatable {
  final String? message;
  final Note? note;

  const RestoreNoteResponse({this.message, this.note});

  factory RestoreNoteResponse.fromJson(Map<String, dynamic> json) {
    return RestoreNoteResponse(
      message: json['message'] as String?,
      note: json['data'] == null
          ? null
          : Note.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': note?.toJson(),
      };

  @override
  List<Object?> get props => [message, note];
}
