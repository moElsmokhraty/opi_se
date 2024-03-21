import '../repo/tasks_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/tasks/data/models/get_all_tasks_models/get_all_tasks_response/get_all_tasks_response.dart';

class GetAllTasksUseCase
    extends UseCase<GetAllTasksResponse, Map<String, int>> {
  final TasksRepo tasksRepo;

  GetAllTasksUseCase(this.tasksRepo);

  @override
  Future<Either<Failure, GetAllTasksResponse>> call(param) async {
    return await tasksRepo.getAllTasks(
      page: param['page'] ?? 1,
      limit: param['limit'] ?? 20,
    );
  }
}
