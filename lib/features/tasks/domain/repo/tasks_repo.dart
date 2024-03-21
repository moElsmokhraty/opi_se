import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/add_task_models/add_task_request.dart';
import '../../data/models/add_task_models/add_task_response.dart';
import '../../data/models/delete_task_models/delete_task_response.dart';
import '../../data/models/delete_task_models/delete_all_tasks_type_response.dart';
import '../../data/models/get_all_tasks_models/get_all_tasks_response/get_all_tasks_response.dart';

abstract class TasksRepo {
  Future<Either<Failure, AddTaskResponse>> addTask(AddTaskRequest request);

  Future<Either<Failure, GetAllTasksResponse>> getAllTasks({
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, GetAllTasksResponse>> getSpecificTasksType({
    required String type,
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, DeleteTaskResponse>> deleteTask({
    required String taskId,
  });

  Future<Either<Failure, DeleteAllTasksTypeResponse>> deleteAllTasksType({
    required String type,
  });

  Future<Either<Failure, DeleteAllTasksTypeResponse>> editTask();
}
