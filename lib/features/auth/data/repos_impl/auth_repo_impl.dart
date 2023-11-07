import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_response.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_request.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_response.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_request.dart';
import '../../domain/repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/login_response.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.login,
        token: token,
        data: request.toJson(),
      );
      return Right(LoginResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChangePasswordResponse>> changePassword(
      ChangePasswordRequest request) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.changePassword,
        token: token,
        data: request.toJson(),
      );
      return Right(ChangePasswordResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.forgotPassword,
        token: token,
        data: request.toJson(),
      );
      return Right(ForgotPasswordResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
