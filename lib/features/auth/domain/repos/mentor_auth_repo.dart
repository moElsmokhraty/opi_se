import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/mentor_login_models/mentor_login_request.dart';
import '../../data/models/mentor_login_models/mentor_login_response/mentor_login_response.dart';
import '../../data/models/mentor_register_models/mentor_register_request/mentor_register_request.dart';

abstract class MentorAuthRepo {
  Future<Either<Failure, String>> register(MentorRegisterRequest request);

  Future<Either<Failure, MentorLoginResponse>> login(MentorLoginRequest request);
}
