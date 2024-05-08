import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_request.dart';
import 'package:opi_se/features/auth/data/models/change_password_models/change_password_response.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_request.dart';
import 'package:opi_se/features/auth/data/models/forgot_password_models/forgot_password_response.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_request.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/login_response.dart';
import 'package:opi_se/features/auth/data/models/register_models/register_request.dart';
import 'package:opi_se/features/auth/data/models/register_models/register_response.dart';
import 'package:opi_se/features/auth/data/models/register_models/upload_national_id_response.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_request.dart';
import 'package:opi_se/features/auth/data/models/user_prefers_models/user_prefers_response.dart';
import 'package:opi_se/features/auth/data/models/verify_account_models/verify_account_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);

  Future<Either<Failure, RegisterResponse>> register(RegisterRequest request);

  Future<Either<Failure, ChangePasswordResponse>> changePassword(
      ChangePasswordRequest request);

  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request);

  Future<Either<Failure, VerifyAccountResponse>> verifyAccount(String email);

  Future<Either<Failure, UploadNationalIdResponse>> uploadNationalId(
      XFile image);

  Future<Either<Failure, UserPrefersResponse>> submitUserPrefers(
      UserPrefersRequest request);

  Future<Either<Failure, UserPrefersResponse>> editUserPrefers(
      UserPrefersRequest request);
}
