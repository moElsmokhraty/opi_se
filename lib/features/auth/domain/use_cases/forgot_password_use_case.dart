import 'package:dartz/dartz.dart';
import '../../data/models/forgot_password_models/forgot_password_request.dart';
import '../../data/models/forgot_password_models/forgot_password_response.dart';
import '../repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';

class ForgotPasswordUseCase
    extends UseCase<ForgotPasswordResponse, ForgotPasswordRequest> {
  ForgotPasswordUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, ForgotPasswordResponse>> call(param) async {
    return await _authRepo.forgotPassword(param);
  }
}
