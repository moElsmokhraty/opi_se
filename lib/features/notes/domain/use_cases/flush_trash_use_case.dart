import 'package:dartz/dartz.dart';
import '../repos/trash_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../data/models/flush_trash_response.dart';
import 'package:opi_se/core/use_cases/no_param_use_case.dart';

class FlushTrashUseCase extends UseCase<FlushTrashResponse> {
  FlushTrashUseCase(this._trashRepo) : super();

  final TrashRepo _trashRepo;

  @override
  Future<Either<Failure, FlushTrashResponse>> call() async {
    return await _trashRepo.flushTrash();
  }
}
