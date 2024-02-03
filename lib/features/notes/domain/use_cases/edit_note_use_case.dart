import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/edit_note_models/edit_note_request.dart';
import '../../data/models/edit_note_models/edit_note_response.dart';

class EditNoteUseCase extends UseCase<EditNoteResponse, EditNoteRequest> {
  EditNoteUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, EditNoteResponse>> call(param) async {
    return await _notesRepo.editNote(param);
  }
}
