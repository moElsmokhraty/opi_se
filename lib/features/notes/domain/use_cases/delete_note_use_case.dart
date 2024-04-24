import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/delete_note_models/delete_note_response.dart';

class DeleteNoteUseCase extends UseCase<DeleteNoteResponse, String> {
  DeleteNoteUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, DeleteNoteResponse>> call(param) async {
    return await _notesRepo.deleteNote(param);
  }
}
