import 'package:dartz/dartz.dart';
import '../repos/notes_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/get_all_notes_response/get_all_notes_response.dart';

class GetNotesUseCase extends UseCase<GetNotesResponse, List> {
  GetNotesUseCase(this._notesRepo) : super();

  final NotesRepo _notesRepo;

  @override
  Future<Either<Failure, GetNotesResponse>> call(param) async {
    return await _notesRepo.getNotes(
      matchId: param[0],
      page: param[1],
      limit: param[2],
    );
  }
}
