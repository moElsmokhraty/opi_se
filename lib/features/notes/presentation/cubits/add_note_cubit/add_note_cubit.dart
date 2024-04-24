import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import '../../../data/models/add_note_models/add_note_request.dart';
import '../../../data/models/get_all_notes_response/note.dart';
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

  void addNoteSocket(Note note) {
    SocketService.emit(
      eventName: 'addNote',
      data: {
        "noteId": note.id,
        "noteTitle": note.noteTitle,
        "noteContent": note.noteContent,
        "noteColor": note.noteColor,
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

  Future<void> addNote() async {
    if (formKey.currentState!.validate()) {
      emit(AddNoteLoading());
      var result = await addNoteUseCase.call(
        AddNoteRequest(
          noteTitle: titleController.text.trim(),
          noteContent: contentController.text.trim(),
          noteColor: noteColors.keys.firstWhere(
            (k) => noteColors[k] == backgroundColor,
          ),
        ),
      );
      result.fold(
        (failure) => emit(AddNoteFailure(failure)),
        (response) {
          addNoteSocket(response.note!);
        },
      );
    }
  }
}
