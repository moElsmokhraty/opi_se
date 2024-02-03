import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/pin_note_response.dart';
import '../../data/models/add_note_models/add_note_request.dart';
import '../../data/models/add_note_models/add_note_response.dart';
import '../../data/models/get_all_notes_response/get_all_notes_response.dart';

abstract class NotesRepo {
  Future<Either<Failure, GetNotesResponse>> getNotes({
    required String matchId,
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, AddNoteResponse>> addNote(
    AddNoteRequest request,
    String matchId,
  );

  Future<Either<Failure, PinNoteResponse>> pinNote(
    String noteId,
    String matchId,
    String isPinned,
  );
}
