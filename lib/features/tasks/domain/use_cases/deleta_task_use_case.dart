import '../repo/tasks_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/delete_task_models/delete_task_response.dart';

class DeleteTaskUseCase extends UseCase<DeleteTaskResponse, String> {
  final TasksRepo tasksRepo;

  DeleteTaskUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, DeleteTaskResponse>> call(param) async {
    return await tasksRepo.deleteTask(taskId: param);
  }
}
