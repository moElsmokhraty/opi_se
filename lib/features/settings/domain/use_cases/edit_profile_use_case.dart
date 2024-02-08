import 'package:dartz/dartz.dart';
import '../repos/settings_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

class EditProfileUseCase extends UseCase<dynamic, dynamic> {
  final SettingsRepo _settingsRepo;

  EditProfileUseCase(this._settingsRepo);

  @override
  Future<Either<Failure, dynamic>> call(param) async {
    return await _settingsRepo.editProfile(param);
  }
}
