import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/no_param_use_case.dart';
import 'package:opi_se/features/home/domain/repos/profile_repo.dart';

class DeleteProfileImageUseCase extends UseCase {
  final ProfileRepo _profileRepo;

  DeleteProfileImageUseCase(this._profileRepo);

  @override
  Future<Either<Failure, String>> call() async {
    return _profileRepo.deleteProfileImage();
  }
}
