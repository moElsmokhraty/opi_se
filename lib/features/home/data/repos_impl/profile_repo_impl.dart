import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:http_parser/http_parser.dart';
import 'package:opi_se/features/home/data/models/get_notifications_response/get_notifications_response.dart';
import '../../domain/repos/profile_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  ProfileRepoImpl(this._apiService);

  @override
  Future<Either<Failure, String>> deleteProfileImage() async {
    try {
      final formData = FormData.fromMap({'type': 'remove'});
      var response = await _apiService.sendFormData(
        endpoint: APIConfig.changeProfileImage,
        formData: formData,
        token: userCache!.token!,
      );
      return Right(response['message']);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changeProfileImage(XFile image) async {
    try {
      final formData = FormData.fromMap({
        'type': 'upload',
        'userImage': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', image.path.split('.').last),
        ),
      });
      var response = await _apiService.sendFormData(
        endpoint: APIConfig.changeProfileImage,
        formData: formData,
        token: userCache!.token!,
      );
      return Right(response['message']);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetNotificationsResponse>> getUserNotifications({
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _apiService.get(
        endpoint: APIConfig.getUserNotifications,
        token: userCache!.token!,
      );
      return Right(GetNotificationsResponse.fromJson(response));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
