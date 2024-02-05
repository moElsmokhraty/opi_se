import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/flush_trash_response.dart';
import '../../data/models/get_trash_response/get_trash_response.dart';
import '../../data/models/delete_note_from_trash_models/delete_note_from_trash_request.dart';
import '../../data/models/delete_note_from_trash_models/delete_note_from_trash_response.dart';

abstract class TrashRepo {
  Future<Either<Failure, GetTrashResponse>> getTrashNotes({
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, FlushTrashResponse>> flushTrash();

  Future<Either<Failure, DeleteNoteFromTrashResponse>> deleteNoteFromTrash(
      DeleteNoteFromTrashRequest request);


}
