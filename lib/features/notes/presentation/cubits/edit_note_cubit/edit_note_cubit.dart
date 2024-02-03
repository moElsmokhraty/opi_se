import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/edit_note_models/edit_note_response.dart';
import '../../../domain/use_cases/edit_note_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../data/models/edit_note_models/edit_note_request.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit(this.editNoteUseCase) : super(EditNoteInitial());

  final EditNoteUseCase editNoteUseCase;

  void setInitialValues(Note note) {
    noteId = note.id;
    titleController.text = note.noteTitle!;
    contentController.text = note.noteContent!;
    backgroundColor = noteColors[note.noteColor!]!;
  }

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  String? noteId;

  final formKey = GlobalKey<FormState>();

  Color? backgroundColor;

  void changeBackgroundColor(Color color) {
    if (color != backgroundColor) {
      backgroundColor = color;
      emit(NoteColorChanged());
    }
  }

  Future<void> editNote() async {
    if (formKey.currentState!.validate()) {
      emit(EditNoteLoading());
      var result = await editNoteUseCase.call(
        EditNoteRequest(
          noteId: noteId,
          noteTitle: titleController.text,
          noteContent: contentController.text,
          noteColor: noteColors.keys.firstWhere(
            (element) => noteColors[element] == backgroundColor,
          ),
        ),
      );
      result.fold(
        (failure) => emit(EditNoteFailure(failure)),
        (response) => emit(EditNoteSuccess(response)),
      );
    }
  }
}
