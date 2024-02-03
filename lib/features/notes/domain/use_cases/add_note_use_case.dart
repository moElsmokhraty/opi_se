import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/add_note_models/add_note_response.dart';

class AddNoteUseCase extends UseCase<AddNoteResponse, List> {
  AddNoteUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, AddNoteResponse>> call(param) async {
    return await _notesRepo.addNote(param[0], param[1]);
  }
}
