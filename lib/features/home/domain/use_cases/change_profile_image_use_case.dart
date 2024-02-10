import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import 'package:opi_se/features/home/domain/repos/profile_repo.dart';

class ChangeProfileImageUseCase extends UseCase<String, XFile> {
  final ProfileRepo _profileRepo;

  ChangeProfileImageUseCase(this._profileRepo);

  @override
  Future<Either<Failure, String>> call(param) async {
    return _profileRepo.changeProfileImage(param);
  }
}
