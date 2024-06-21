import 'package:dartz/dartz.dart';
import '../repos/mentor_auth_repo.dart';
import '../../../../core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/auth/data/models/mentor_login_models/mentor_login_request.dart';
import 'package:opi_se/features/auth/data/models/mentor_login_models/mentor_login_response/mentor_login_response.dart';

class MentorLoginUseCase
    extends UseCase<MentorLoginResponse, MentorLoginRequest> {
  final MentorAuthRepo mentorAuthRepo;

  MentorLoginUseCase(this.mentorAuthRepo);

  @override
  Future<Either<Failure, MentorLoginResponse>> call(param) async {
    return await mentorAuthRepo.login(param);
  }
}
