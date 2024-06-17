import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repo/tasks_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/errors/server_failure.dart';
import '../models/add_task_models/add_task_request.dart';
import '../models/add_task_models/add_task_response.dart';
import '../models/edit_task_models/edit_task_request.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/edit_task_models/edit_task_response.dart';
import '../models/delete_task_models/delete_task_response.dart';
import '../models/delete_task_models/delete_all_tasks_type_response.dart';
import '../models/get_all_tasks_models/get_all_tasks_response/get_all_tasks_response.dart';

class TasksRepoImpl implements TasksRepo {
  final ApiService _apiService;

  TasksRepoImpl(this._apiService);

  @override
  Future<Either<Failure, AddTaskResponse>> addTask(
    AddTaskRequest request,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.addTask,
        body: request.toJson(),
        params: {'matchId': userCache!.matchId},
      );
      return Right(AddTaskResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetAllTasksResponse>> getAllTasks({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getAllTasks,
        params: {
          'matchId': userCache!.matchId,
          'page': page,
          'limit': limit,
        },
      );
      return Right(GetAllTasksResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetAllTasksResponse>> getSpecificTasksType({
    required String type,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getSpecificTasksType,
        params: {
          'matchId': userCache!.matchId,
          'type': type,
          'page': page,
          'limit': limit,
        },
      );
      return Right(GetAllTasksResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteTaskResponse>> deleteTask({
    required String taskId,
  }) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.deleteTask,
        params: {'taskId': taskId, 'matchId': userCache!.matchId},
      );
      return Right(DeleteTaskResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteAllTasksTypeResponse>> deleteAllTasksType({
    required String type,
  }) async {
    try {
      var data = await _apiService.delete(
        endpoint: APIConfig.deleteAllTasksType,
        params: {'type': type, 'matchId': userCache!.matchId},
      );
      return Right(DeleteAllTasksTypeResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EditTaskResponse>> editTask({
    required String taskId,
    required EditTaskRequest request,
  }) async {
    try {
      var data = await _apiService.patch(
        endpoint: APIConfig.editTask,
        body: request.toJson(),
        params: {'taskId': taskId, 'matchId': userCache!.matchId},
      );
      return Right(EditTaskResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
