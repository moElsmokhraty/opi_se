part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskStartDateChanged extends AddTaskState {}

final class AddTaskEndDateChanged extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {
  final AddTaskResponse response;

  AddTaskSuccess(this.response);
}

final class AddTaskFailure extends AddTaskState {
  final String errMessage;

  AddTaskFailure(this.errMessage);
}
