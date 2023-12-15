import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import 'package:opi_se/core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
import '../../domain/repos/chat_repo.dart';
import '../models/get_chat_response/get_chat_response.dart';

class ChatRepoImpl implements ChatRepo {
  final ApiService _apiService;

  ChatRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetChatResponse>> getChat(
    String userId, {
    int page = 1,
    int limit = 10,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getChat,
        body: {'matchId': '657864d6b9aeadd65b0d92b9'},
        params: {
          'page': page,
          'limit': limit,
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
}
