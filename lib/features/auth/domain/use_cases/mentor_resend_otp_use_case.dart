import 'package:dartz/dartz.dart';
import '../repos/mentor_auth_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

class MentorResendOtpUseCase extends UseCase<String, String> {
  final MentorAuthRepo mentorAuthRepo;

  MentorResendOtpUseCase(this.mentorAuthRepo);

  @override
  Future<Either<Failure, String>> call(param) async {
    return await mentorAuthRepo.resendOtp(param);
  }
}
