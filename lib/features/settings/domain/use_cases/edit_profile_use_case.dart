import 'package:dartz/dartz.dart';
import '../repos/settings_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/edit_profile_request.dart';

class EditProfileUseCase extends UseCase<String, EditProfileRequest> {
  final SettingsRepo _settingsRepo;

  EditProfileUseCase(this._settingsRepo);

  @override
  Future<Either<Failure, String>> call(param) async {
    return await _settingsRepo.editProfile(param);
  }
}
