import 'package:equatable/equatable.dart';

class DeleteNoteFromTrashRequest extends Equatable {
  final String noteId;
  final String matchId;

  const DeleteNoteFromTrashRequest({
    required this.noteId,
    required this.matchId,
  });

  Map<String, dynamic> toJson() => {
        'noteId': noteId,
        'matchId': matchId,
      };

  @override
  List<Object?> get props => [noteId];
}
