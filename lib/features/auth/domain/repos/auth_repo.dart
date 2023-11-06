import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_request.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/login_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
}
