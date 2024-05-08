part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksChangeSelectedIndex extends TasksState {}

final class GetTasksLoading extends TasksState {}

final class GetTasksFailure extends TasksState {
  final String errMessage;

  GetTasksFailure(this.errMessage);
}

final class GetTasksSuccess extends TasksState {
  final List<Task> tasks;

  GetTasksSuccess(this.tasks);
}

final class DeleteTaskLoading extends TasksState {}

final class DeleteTaskFailure extends TasksState {
  final String errMessage;

  DeleteTaskFailure(this.errMessage);
}

final class DeleteTaskSuccess extends TasksState {}

final class TasksChangeFocusDate extends TasksState {}
