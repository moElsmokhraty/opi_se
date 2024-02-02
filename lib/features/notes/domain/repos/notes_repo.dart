import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/get_all_notes_response/get_all_notes_response.dart';

abstract class NotesRepo {
  Future<Either<Failure, GetNotesResponse>> getNotes({
    required String matchId,
    int page = 1,
    int limit = 10,
  });
}
