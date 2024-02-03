part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class NoteColorChanged extends EditNoteState {}

class EditNoteLoading extends EditNoteState {}

class EditNoteSuccess extends EditNoteState {
  final EditNoteResponse response;

  EditNoteSuccess(this.response);
}

class EditNoteFailure extends EditNoteState {
  final Failure failure;

  EditNoteFailure(this.failure);
}
