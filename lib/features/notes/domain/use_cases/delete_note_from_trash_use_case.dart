import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/notes/domain/repos/trash_repo.dart';
import '../../data/models/delete_note_from_trash_models/delete_note_from_trash_request.dart';
import '../../data/models/delete_note_from_trash_models/delete_note_from_trash_response.dart';

class DeleteNoteFromTrashUseCase
    extends UseCase<DeleteNoteFromTrashResponse, DeleteNoteFromTrashRequest> {
  DeleteNoteFromTrashUseCase(this._trashRepo) : super();

  final TrashRepo _trashRepo;

  @override
  Future<Either<Failure, DeleteNoteFromTrashResponse>> call(param) async {
    return await _trashRepo.deleteNoteFromTrash(param);
  }
}
