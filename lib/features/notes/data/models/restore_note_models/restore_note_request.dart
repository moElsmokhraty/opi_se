import 'package:equatable/equatable.dart';

class RestoreNoteRequest extends Equatable {
  final String noteId;
  final String matchId;

  const RestoreNoteRequest({
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
