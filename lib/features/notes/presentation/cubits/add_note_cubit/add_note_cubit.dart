import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import '../../../domain/use_cases/add_note_use_case.dart';
import '../../../data/models/add_note_models/add_note_request.dart';
import '../../../data/models/add_note_models/add_note_response.dart';

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

  Future<void> addNote() async {
    if (formKey.currentState!.validate()) {
      emit(AddNoteLoading());
      var result = await addNoteUseCase.call([
        AddNoteRequest(
          noteTitle: titleController.text.trim(),
          noteContent: contentController.text.trim(),
          noteColor: noteColors.keys.firstWhere(
            (k) => noteColors[k] == backgroundColor,
          ),
        ),
        matchId,
      ]);
      result.fold(
        (failure) => emit(AddNoteFailure(failure)),
        (response) => emit(AddNoteSuccess(response)),
      );
    }
  }
}
