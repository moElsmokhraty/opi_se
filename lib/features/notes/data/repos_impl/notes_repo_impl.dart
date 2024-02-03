import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/features/notes/data/models/add_note_models/add_note_request.dart';
import 'package:opi_se/features/notes/data/models/add_note_models/add_note_response.dart';
import 'package:opi_se/features/notes/data/models/delete_note_models/delete_note_request.dart';
import 'package:opi_se/features/notes/data/models/delete_note_models/delete_note_response.dart';
import 'package:opi_se/features/notes/data/models/pin_note_response.dart';
import '../../domain/repos/notes_repo.dart';
import '../../../../core/utils/constants.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import 'package:opi_se/core/utils/api_config/api_service.dart';
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

  @override
  Future<Either<Failure, AddNoteResponse>> addNote(
    AddNoteRequest request,
    String matchId,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.addNote,
        token: token,
        body: request.toJson(),
        params: {'matchId': matchId},
      );
      return Right(AddNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PinNoteResponse>> pinNote(
    String noteId,
    String matchId,
    String isPinned,
  ) async {
    try {
      var data = await _apiService.patch(
        endpoint: APIConfig.pinNote,
        token: token,
        body: {"isPinned": isPinned},
        params: {
          'matchId': matchId,
          'noteId': noteId,
        },
      );
      return Right(PinNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteNoteResponse>> deleteNote(
    DeleteNoteRequest request,
  ) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.deleteNote,
        token: token,
        params: request.toJson(),
      );
      return Right(DeleteNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
