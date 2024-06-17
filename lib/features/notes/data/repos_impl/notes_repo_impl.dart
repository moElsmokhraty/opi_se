import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/pin_note_response.dart';
import '../../domain/repos/notes_repo.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../models/add_note_models/add_note_request.dart';
import '../models/add_note_models/add_note_response.dart';
import '../models/edit_note_models/edit_note_request.dart';
import '../models/edit_note_models/edit_note_response.dart';
import '../models/delete_note_models/delete_note_response.dart';
import '../models/restore_note_models/restore_note_request.dart';
import '../models/restore_note_models/restore_note_response.dart';
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
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.addNote,
        body: request.toJson(),
        params: {'matchId': userCache?.matchId!},
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
    bool isPinned,
  ) async {
    try {
      var data = await _apiService.patch(
        endpoint: APIConfig.pinNote,
        body: {"isPinned": !isPinned},
        params: {
          'matchId': userCache!.matchId!,
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
    String noteId,
  ) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.deleteNote,
        params: {
          'matchId': userCache!.matchId!,
          'noteId': noteId,
        },
      );
      return Right(DeleteNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EditNoteResponse>> editNote(
    EditNoteRequest request,
  ) async {
    try {
      var data = await _apiService.patch(
        endpoint: APIConfig.editNote,
        body: request.toJson(),
        params: {
          'matchId': userCache!.matchId!,
          'noteId': request.noteId,
        },
      );
      return Right(EditNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RestoreNoteResponse>> restoreNote(
      RestoreNoteRequest request) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.restoreNote,
        params: request.toJson(),
      );
      return Right(RestoreNoteResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
