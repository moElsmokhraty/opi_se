import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../data/models/task.dart';
import '../../../domain/use_cases/delete_task_use_case.dart';
import '../../../domain/use_cases/get_specific_tasks_type_use_case.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(
    this.getSpecificTasksTypeUseCase,
    this.deleteTaskUseCase,
  ) : super(TasksInitial());

  final GetSpecificTasksTypeUseCase getSpecificTasksTypeUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;

  int selectedIndex = 0;

  DateTime focusDate = DateTime.now();

  List<Task> todoTasks = [];
  List<Task> inProgressTasks = [];
  List<Task> doneTasks = [];

  Future<void> getTodoTasks() async {
    if (userCache?.partner?.id == null) return;
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call({'type': 'toDo'});
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage, 0)),
      (response) {
        todoTasks.clear();
        todoTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response.tasks ?? []));
      },
    );
  }

  Future<void> getInProgressTasks() async {
    if (userCache?.partner?.id == null) return;
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call(
      {'type': 'inProgress'},
    );
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage, 1)),
      (response) {
        inProgressTasks.clear();
        inProgressTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response.tasks ?? []));
      },
    );
  }

  Future<void> getDoneTasks() async {
    if (userCache?.partner?.id == null) return;
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call({'type': 'done'});
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage, 2)),
      (response) {
        doneTasks.clear();
        doneTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response.tasks ?? []));
      },
    );
  }

  Future<void> deleteTask(String taskId) async {
    emit(DeleteTaskLoading(taskId));
    final result = await deleteTaskUseCase.call(taskId);
    result.fold(
      (failure) => emit(DeleteTaskFailure(failure.errMessage)),
      (response) {
        if (selectedIndex == 0) {
          todoTasks.removeWhere((element) => element.id == taskId);
        } else if (selectedIndex == 1) {
          inProgressTasks.removeWhere((element) => element.id == taskId);
        } else {
          doneTasks.removeWhere((element) => element.id == taskId);
        }
        deleteTaskSocket(taskId);
        emit(DeleteTaskSuccess());
      },
    );
  }

  void deleteTaskSocket(String taskId) {
    SocketService.emit(
      eventName: 'deleteTask',
      data: {'taskId': taskId},
    );
  }

  void changeFocusDate(DateTime selectedDate) {
    focusDate = selectedDate;
    emit(TasksChangeFocusDate());
  }

  void listenOnGetTaskFromSocket() {
    SocketService.on(
      eventName: 'getTask',
      handler: (data) {
        final task = Task.fromJson(data['data']);
        todoTasks.add(task);
        emit(GetTasksSuccess(todoTasks));
      },
    );
  }

  void listenOnTaskDeletedFromSocket() {
    SocketService.on(
      eventName: 'taskDeleted',
      handler: (data) {
        if (data['data']['taskStatus'] == 'toDo') {
          todoTasks.removeWhere(
            (element) => element.id == data['data']['taskId'],
          );
        } else if (data['data']['taskStatus'] == 'inProgress') {
          inProgressTasks.removeWhere(
            (element) => element.id == data['data']['taskId'],
          );
        } else {
          doneTasks.removeWhere(
            (element) => element.id == data['data']['taskId'],
          );
        }
        emit(DeleteTaskSuccess());
      },
    );
  }

  void listenOnTaskUpdatedFromSocket() {
    SocketService.on(
      eventName: 'getUpdatedTask',
      handler: (data) {
        final Task task = Task.fromJson(data['data']);
        if (data['data']['taskStatus'] == 'toDo') {
          final index = todoTasks.indexWhere(
            (element) => element.id == data['data']['_id'],
          );
          todoTasks[index] = task;
          emit(GetTasksSuccess(todoTasks));
        } else if (data['data']['taskStatus'] == 'inProgress') {
          final index = inProgressTasks.indexWhere(
            (element) => element.id == data['data']['_id'],
          );
          inProgressTasks[index] = task;
          emit(GetTasksSuccess(inProgressTasks));
        } else {
          final index = doneTasks.indexWhere(
            (element) => element.id == data['data']['_id'],
          );
          doneTasks[index] = task;
          emit(GetTasksSuccess(doneTasks));
        }
      },
    );
  }

  void deleteAllTasksSocket() {
    SocketService.emit(
      eventName: 'deleteAllTasks',
      data: {"deleteAllTasks": true},
    );
    todoTasks.clear();
    inProgressTasks.clear();
    doneTasks.clear();
    emit(GetTasksSuccess(const []));
  }

  void listenOnAllTasksDeletedSocket() {
    SocketService.on(
      eventName: 'allTasksDeleted',
      handler: (data) {
        todoTasks.clear();
        inProgressTasks.clear();
        doneTasks.clear();
        emit(GetTasksSuccess(const []));
      },
    );
  }
}
