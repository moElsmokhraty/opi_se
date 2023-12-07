import '../repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_request.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_response.dart';

class SubmitUserPrefersUseCase
    extends UseCase<UserPrefersResponse, UserPrefersRequest> {
  SubmitUserPrefersUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, UserPrefersResponse>> call(param) async {
    return await _authRepo.submitUserPrefers(param);
  }
}
