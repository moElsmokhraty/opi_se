import 'package:equatable/equatable.dart';

import '../get_all_notes_response/note.dart';

class EditNoteResponse extends Equatable {
  final String? message;
  final Note? data;

  const EditNoteResponse({this.message, this.data});

  factory EditNoteResponse.fromJson(Map<String, dynamic> json) {
    return EditNoteResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Note.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [message, data];
}
