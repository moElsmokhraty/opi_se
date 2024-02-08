import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/restore_note_models/restore_note_request.dart';
import '../../data/models/restore_note_models/restore_note_response.dart';

class RestoreNoteUseCase
    extends UseCase<RestoreNoteResponse, RestoreNoteRequest> {
  RestoreNoteUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, RestoreNoteResponse>> call(param) async {
    return await _notesRepo.restoreNote(param);
  }
}
