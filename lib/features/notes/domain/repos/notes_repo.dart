import 'package:dartz/dartz.dart';
import 'package:opi_se/features/notes/data/models/edit_note_models/edit_note_request.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/edit_note_models/edit_note_response.dart';
import '../../data/models/pin_note_response.dart';
import '../../data/models/add_note_models/add_note_request.dart';
import '../../data/models/add_note_models/add_note_response.dart';
import '../../data/models/delete_note_models/delete_note_response.dart';
import '../../data/models/get_all_notes_response/get_all_notes_response.dart';
import '../../data/models/restore_note_models/restore_note_request.dart';
import '../../data/models/restore_note_models/restore_note_response.dart';

abstract class NotesRepo {
  Future<Either<Failure, GetNotesResponse>> getNotes({
    required String matchId,
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, AddNoteResponse>> addNote(AddNoteRequest request);

  Future<Either<Failure, PinNoteResponse>> pinNote(
    String noteId,
    bool isPinned,
  );

  Future<Either<Failure, DeleteNoteResponse>> deleteNote(
    String noteId,
  );

  Future<Either<Failure, EditNoteResponse>> editNote(EditNoteRequest request);

  Future<Either<Failure, RestoreNoteResponse>> restoreNote(
      RestoreNoteRequest request);
}
