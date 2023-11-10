import 'package:dartz/dartz.dart';
import '../repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/verify_account_models/verify_account_response.dart';

class VerifyAccountUseCase extends UseCase<VerifyAccountResponse, String> {
  VerifyAccountUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, VerifyAccountResponse>> call(param) async {
    return await _authRepo.verifyAccount(param);
  }
}
