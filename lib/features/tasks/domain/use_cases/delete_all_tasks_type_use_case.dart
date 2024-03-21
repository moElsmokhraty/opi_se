import '../repo/tasks_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/delete_task_models/delete_all_tasks_type_response.dart';

class DeleteAllTasksTypeUseCase
    extends UseCase<DeleteAllTasksTypeResponse, String> {
  final TasksRepo tasksRepo;

  DeleteAllTasksTypeUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, DeleteAllTasksTypeResponse>> call(param) async {
    return await tasksRepo.deleteAllTasksType(type: param);
  }
}
