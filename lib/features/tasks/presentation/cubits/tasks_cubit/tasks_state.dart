part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class GetTasksLoading extends TasksState {}

final class GetTasksFailure extends TasksState {
  final String errMessage;
  final int index;

  GetTasksFailure(this.errMessage, this.index);
}

final class GetTasksSuccess extends TasksState {
  final List<Task> tasks;

  GetTasksSuccess(this.tasks);
}

final class DeleteTaskLoading extends TasksState {
  final String taskId;

  DeleteTaskLoading(this.taskId);
}

final class DeleteTaskFailure extends TasksState {
  final String errMessage;

  DeleteTaskFailure(this.errMessage);
}

final class DeleteTaskSuccess extends TasksState {}

final class TasksChangeFocusDate extends TasksState {}
