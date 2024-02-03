import 'package:equatable/equatable.dart';

class DeleteNoteRequest extends Equatable {
  final String noteId;
  final String matchId;

  const DeleteNoteRequest({
    required this.noteId,
    required this.matchId,
  });

  Map<String, dynamic> toJson() {
    return {
      'noteId': noteId,
      'matchId': matchId,
    };
  }

  @override
  List<Object?> get props => [noteId, matchId];
}
