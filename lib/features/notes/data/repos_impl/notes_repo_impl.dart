import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repos/notes_repo.dart';
import '../models/get_all_notes_response/get_all_notes_response.dart';

class NotesRepoImpl implements NotesRepo {
  final ApiService _apiService;

  NotesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetNotesResponse>> getNotes({
    required String matchId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getNotes,
        token: token,
        params: {
          'matchId': matchId,
          'page': page,
          'limit': limit,
        },
      );
      return Right(GetNotesResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
