import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import '../../../domain/use_cases/add_note_use_case.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.addNoteUseCase) : super(AddNoteInitial());

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }

  final AddNoteUseCase addNoteUseCase;

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Color backgroundColor = noteColors['--note1']!;

  void changeBackgroundColor(Color color) {
    if (color != backgroundColor) {
      backgroundColor = color;
      emit(NoteColorChanged());
    }
  }

  void addNote() {
    if (formKey.currentState!.validate()) {
      SocketService.emit(
        eventName: 'addNote',
        data: {
          'noteTitle': titleController.text,
          'noteContent': contentController.text,
          'noteColor': noteColors.keys.firstWhere(
            (k) => noteColors[k] == backgroundColor,
          ),
        },
        ack: (data) {
          if (data['success'] == true) {
            emit(AddNoteSuccess());
          } else {
            emit(AddNoteFailure(
              ServerFailure(errMessage: 'Error while adding note!'),
            ));
          }
        },
      );
    }
  }
}
