part of 'edit_task_cubit.dart';

@immutable
sealed class EditTaskState {}

final class EditTaskInitial extends EditTaskState {}

final class EditTaskLoading extends EditTaskState {}

final class EditTaskSuccess extends EditTaskState {
  final EditTaskResponse response;

  EditTaskSuccess(this.response);
}

final class EditTaskFailure extends EditTaskState {
  final String errMessage;

  EditTaskFailure(this.errMessage);
}

final class EditTaskStartDateChanged extends EditTaskState {}

final class EditTaskEndDateChanged extends EditTaskState {}
