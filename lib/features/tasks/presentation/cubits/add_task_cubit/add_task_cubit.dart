import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/task.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/features/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:opi_se/features/tasks/data/models/add_task_models/add_task_request.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._addTaskUseCase) : super(AddTaskInitial());

  final AddTaskUseCase _addTaskUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  TextEditingController startDateController = TextEditingController();

  TextEditingController endDateController = TextEditingController();

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      startDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      emit(AddTaskStartDateChanged());
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDateController.text.isEmpty
          ? DateTime.now()
          : DateFormat('MM/dd/yyyy')
              .parse(startDateController.text)
              .add(const Duration(days: 1)),
      firstDate: startDateController.text.isEmpty
          ? DateTime.now()
          : DateFormat('MM/dd/yyyy')
              .parse(startDateController.text)
              .add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      endDateController.text = DateFormat('MM/dd/yyyy').format(picked);
      emit(AddTaskEndDateChanged());
    }
  }

  Future<void> addTask() async {
    if (!formKey.currentState!.validate()) return;
    emit(AddTaskLoading());
    var result = await _addTaskUseCase.call(
      AddTaskRequest(
        title: titleController.text,
        content: contentController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
      ),
    );
    result.fold(
      (failure) => emit(AddTaskFailure(failure.errMessage)),
      (response) => addTaskSocket(response.data!),
    );
  }

  void addTaskSocket(Task task) {
    SocketService.emit(
      eventName: 'addTask',
      data: task.toJson(),
      ack: (data) {
        if (data['success']) {
          emit(AddTaskSuccess());
        } else {
          emit(AddTaskFailure('Failed To Add Task'));
        }
      },
    );
  }
}
