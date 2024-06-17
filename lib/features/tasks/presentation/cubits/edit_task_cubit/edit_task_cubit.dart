import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:opi_se/features/tasks/data/models/task.dart';
import '../../../../../core/utils/socket_service.dart';
import '../../../domain/use_cases/edit_task_use_case.dart';
import '../../../data/models/edit_task_models/edit_task_request.dart';
import '../../../data/models/edit_task_models/edit_task_response.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this._editTaskUseCase) : super(EditTaskInitial());

  final EditTaskUseCase _editTaskUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String taskId = '';

  String taskStatus = '';

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  TextEditingController startDateController = TextEditingController();

  TextEditingController endDateController = TextEditingController();

  void setValues(Task task) {
    taskId = task.id!;
    titleController.text = task.title ?? 'Untitled';
    contentController.text = task.content ?? 'Unknown';
    taskStatus = task.taskStatus ?? 'toDo';
    startDateController.text = DateFormat('MM/dd/yyyy').format(task.startDate!);
    endDateController.text = DateFormat('MM/dd/yyyy').format(task.endDate!);
    emit(EditTaskInitial());
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateFormat('MM/dd/yyyy').parse(startDateController.text),
      firstDate: DateFormat('MM/dd/yyyy').parse(startDateController.text),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      startDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      emit(EditTaskStartDateChanged());
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateFormat('MM/dd/yyyy').parse(endDateController.text),
      firstDate: DateFormat('MM/dd/yyyy').parse(startDateController.text),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      endDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      emit(EditTaskEndDateChanged());
    }
  }

  Future<void> editTask() async {
    if (!formKey.currentState!.validate()) return;
    var result = await _editTaskUseCase.call({
      'taskId': taskId,
      'request': EditTaskRequest(
        title: titleController.text.trim(),
        content: contentController.text.trim(),
        startDate: startDateController.text.trim(),
        endDate: endDateController.text.trim(),
        taskStatus: taskStatus.trim(),
      ),
    });
    result.fold(
      (failure) => emit(EditTaskFailure(failure.errMessage)),
      (response) {
        editTaskSocket(response.task!);
        emit(EditTaskSuccess(response));
      },
    );
  }

  void editTaskSocket(Task task) {
    SocketService.emit(
      eventName: 'updateTask',
      data: task.toJson(),
      ack: (data) {
        debugPrint(data);
      },
    );
  }
}
