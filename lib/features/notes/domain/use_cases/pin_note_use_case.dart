import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../data/models/pin_note_response.dart';
import 'package:opi_se/core/use_cases/use_case.dart';

class PinNoteUseCase extends UseCase<PinNoteResponse, List<String>> {
  PinNoteUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, PinNoteResponse>> call(param) async {
    return await _notesRepo.pinNote(param[0], param[1], param[2]);
  }
}
