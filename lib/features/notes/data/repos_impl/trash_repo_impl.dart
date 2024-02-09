import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repos/trash_repo.dart';
import '../models/flush_trash_response.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/get_trash_response/get_trash_response.dart';
import '../models/delete_note_from_trash_models/delete_note_from_trash_request.dart';
import '../models/delete_note_from_trash_models/delete_note_from_trash_response.dart';

class TrashRepoImpl implements TrashRepo {
  final ApiService _apiService;

  TrashRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetTrashResponse>> getTrashNotes({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getTrash,
        token: userCache!.token!,
        params: {
          'matchId': userCache!.matchId!,
          'page': page,
          'limit': limit,
        },
      );
      return Right(GetTrashResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FlushTrashResponse>> flushTrash() async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.flushTrash,
        token: userCache!.token!,
        params: {'matchId': userCache!.matchId!},
      );
      return Right(FlushTrashResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteNoteFromTrashResponse>> deleteNoteFromTrash(
      DeleteNoteFromTrashRequest request) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.flushTrash,
        token: userCache!.token!,
        params: request.toJson(),
      );
      return Right(DeleteNoteFromTrashResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
