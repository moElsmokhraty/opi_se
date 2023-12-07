import 'package:dartz/dartz.dart';
import '../repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/register_models/register_request.dart';
import '../../data/models/register_models/register_response.dart';

class RegisterUseCase extends UseCase<RegisterResponse, RegisterRequest> {
  RegisterUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, RegisterResponse>> call(param) async {
    return await _authRepo.register(param);
  }
}
