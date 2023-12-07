import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_request.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_response.dart';
import '../../domain/repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_request.dart';
import 'package:opi_se/features/auth/data/models/register_models/register_request.dart';
import 'package:opi_se/features/auth/data/models/register_models/register_response.dart';
import 'package:opi_se/features/auth/data/models/register_models/upload_national_id_response.dart';
import 'package:opi_se/features/auth/data/models/verify_account_models/verify_account_response.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/login_response.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_response.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_request.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_response.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.login,
        token: token,
        body: request.toJson(),
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
  Future<Either<Failure, RegisterResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.register,
        token: token,
        body: request.toJson(),
      );
      return Right(RegisterResponse.fromJson(data));
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
        body: request.toJson(),
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
        body: request.toJson(),
      );
      return Right(ForgotPasswordResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyAccountResponse>> verifyAccount(
    String email,
  ) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.verifyAccount,
        token: token,
        params: {'email': email},
      );
      return Right(VerifyAccountResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UploadNationalIdResponse>> uploadNationalId(
    XFile image,
  ) async {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
      ),
    );
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', image.path.split('.').last),
        ),
      });
      var response = await dio.post(APIConfig.uploadNationalId,
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}));
      return Right(UploadNationalIdResponse.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserPrefersResponse>> submitUserPrefers(
    UserPrefersRequest request,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.submitUserPrefers,
        token: token,
        body: request.toJson(),
      );
      return Right(UserPrefersResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
