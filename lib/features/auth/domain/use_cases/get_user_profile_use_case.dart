import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/no_param_use_case.dart';
import 'package:opi_se/features/auth/data/models/user_profile_models/get_user_profile_response.dart';
import '../repos/auth_repo.dart';

class GetUserProfileUseCase extends UseCase<GetUserProfileResponse> {
  GetUserProfileUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, GetUserProfileResponse>> call() async {
    return await _authRepo.getUserProfile();
  }
}
