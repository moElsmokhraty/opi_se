import 'package:dartz/dartz.dart';
import '../repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/change_password_models/change_password_request.dart';
import '../../data/models/change_password_models/change_password_response.dart';

class ChangePasswordUseCase
    extends UseCase<ChangePasswordResponse, ChangePasswordRequest> {
  ChangePasswordUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, ChangePasswordResponse>> call(param) async {
    return await _authRepo.changePassword(param);
  }
}
