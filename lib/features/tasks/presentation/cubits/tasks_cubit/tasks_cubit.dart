import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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

  void changeSelectedIndex(int index) {
    if (index == selectedIndex) return;
    selectedIndex = index;
    emit(TasksChangeSelectedIndex());
  }

  Future<void> getTodoTasks() async {
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call({'type': 'toDo'});
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage)),
      (response) {
        todoTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response));
      },
    );
  }

  Future<void> getInProgressTasks() async {
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call(
      {'type': 'inProgress'},
    );
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage)),
      (response) {
        inProgressTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response));
      },
    );
  }

  Future<void> getDoneTasks() async {
    emit(GetTasksLoading());
    final result = await getSpecificTasksTypeUseCase.call({'type': 'done'});
    result.fold(
      (failure) => emit(GetTasksFailure(failure.errMessage)),
      (response) {
        doneTasks.addAll(response.tasks ?? []);
        emit(GetTasksSuccess(response));
      },
    );
  }

  Future<void> deleteTask(String id) async {
    emit(DeleteTaskLoading());
    final result = await deleteTaskUseCase.call(id);
    result.fold(
      (failure) => emit(DeleteTaskFailure(failure.errMessage)),
      (response) {
        if (selectedIndex == 0) {
          todoTasks.removeWhere((element) => element.id == id);
        } else if (selectedIndex == 1) {
          inProgressTasks.removeWhere((element) => element.id == id);
        } else {
          doneTasks.removeWhere((element) => element.id == id);
        }
        emit(DeleteTaskSuccess());
      },
    );
  }

  void changeFocusDate(DateTime selectedDate) {
    focusDate = selectedDate;
    emit(TasksChangeFocusDate());
  }
}
