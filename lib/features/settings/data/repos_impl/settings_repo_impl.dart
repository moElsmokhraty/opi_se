import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repos/settings_repo.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';

import '../models/edit_profile_request.dart';

class SettingsRepoImpl implements SettingsRepo {
  final ApiService _apiService;

  SettingsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, String>> editProfile(
    EditProfileRequest request,
  ) async {
    try {
      var data = await _apiService.patch(
        endpoint: APIConfig.editProfile,
        token: userCache!.token!,
        body: request.toJson(),
      );
      return Right(data['message']);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
