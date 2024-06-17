import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/repos/chat_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../models/upload_chat_media_response.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import '../models/get_chat_response/get_chat_response.dart';
import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
import '../models/get_chat_media_response/get_chat_media_response.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService _apiService;

  ChatRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetChatResponse>> getChat(
    String matchId, {
    int page = 1,
    int limit = 10,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getChat,
        params: {
          'page': page,
          'limit': limit,
          'matchId': matchId,
        },
      );
      return Right(GetChatResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetChatMediaResponse>> getChatMedia({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getChatMedia,
        params: {
          'page': page,
          'limit': limit,
          'matchId': userCache!.matchId!,
        },
      );
      return Right(GetChatMediaResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UploadChatMediaResponse>> uploadChatImages({
    required List<XFile> mediaFiles,
  }) async {
    if (mediaFiles.isEmpty) {
      return Left(ServerFailure(errMessage: 'No media selected!'));
    }
    try {
      FormData formData = FormData.fromMap({});
      for (var file in mediaFiles) {
        formData.files.add(MapEntry(
          'chatMedia',
          await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', file.path.split('.').last),
          ),
        ));
      }
      var data = await _apiService.sendFormData(
        endpoint: APIConfig.uploadChatMedia,
        params: {'matchId': userCache!.matchId!},
        formData: formData,
      );
      return Right(UploadChatMediaResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
