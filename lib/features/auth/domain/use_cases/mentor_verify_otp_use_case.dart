import 'package:dartz/dartz.dart';
import '../repos/mentor_auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/otp_models/verify_otp_request.dart';

class MentorVerifyOtpUseCase extends UseCase<String, VerifyOtpRequest> {
  final MentorAuthRepo mentorAuthRepo;

  MentorVerifyOtpUseCase(this.mentorAuthRepo);

  @override
  Future<Either<Failure, String>> call(param) async {
    return await mentorAuthRepo.verifyOtp(param);
  }
}
