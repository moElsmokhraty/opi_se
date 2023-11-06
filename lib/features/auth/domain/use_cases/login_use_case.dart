import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/login_models/login_response/login_response.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_request.dart';
import '../repos/auth_repo.dart';

class LoginUseCase extends UseCase<LoginResponse, LoginRequest> {
  LoginUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest param) async {
    return await _authRepo.login(param);
  }
}
