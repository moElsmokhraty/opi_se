import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/features/auth/data/models/mentor_login_models/mentor_login_request.dart';
import 'package:opi_se/features/auth/data/models/mentor_login_models/mentor_login_response/mentor_login_response.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/mentor_auth_repo.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/mentor_register_models/mentor_register_request/mentor_register_request.dart';

class MentorAuthRepoImpl extends MentorAuthRepo {
  final ApiService _apiService;

  MentorAuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, String>> register(
    MentorRegisterRequest request,
  ) async {
    try {
      await _apiService.post(
        endpoint: APIConfig.mentorRegister,
        body: request.toJson(),
      );
      return const Right(
        'Account created successfully! Please verify your email to login.',
      );
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MentorLoginResponse>> login(
    MentorLoginRequest request,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.mentorLogin,
        body: request.toJson(),
      );
      return Right(MentorLoginResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
