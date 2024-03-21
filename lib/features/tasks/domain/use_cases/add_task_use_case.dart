import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/tasks/data/models/add_task_models/add_task_request.dart';
import 'package:opi_se/features/tasks/data/models/add_task_models/add_task_response.dart';

import '../repo/tasks_repo.dart';

class AddTaskUseCase extends UseCase<AddTaskResponse, AddTaskRequest> {
  final TasksRepo tasksRepo;

  AddTaskUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, AddTaskResponse>> call(param) async {
    return await tasksRepo.addTask(param);
  }
}
