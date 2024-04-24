import '../repo/tasks_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/edit_task_models/edit_task_response.dart';

class EditTaskUseCase extends UseCase<EditTaskResponse, Map<String, dynamic>> {
  final TasksRepo tasksRepo;

  EditTaskUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, EditTaskResponse>> call(param) async {
    return await tasksRepo.editTask(
      taskId: param['taskId'],
      request: param['request'],
    );
  }
}
