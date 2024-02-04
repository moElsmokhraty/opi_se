import 'package:dartz/dartz.dart';
import '../repos/trash_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/get_trash_response/get_trash_response.dart';

class GetTrashUseCase extends UseCase<GetTrashResponse, List<int>> {
  GetTrashUseCase(this._trashRepo) : super();

  final TrashRepo _trashRepo;

  @override
  Future<Either<Failure, GetTrashResponse>> call(param) async {
    return await _trashRepo.getTrashNotes(
      page: param[0],
      limit: param[1],
    );
  }
}
