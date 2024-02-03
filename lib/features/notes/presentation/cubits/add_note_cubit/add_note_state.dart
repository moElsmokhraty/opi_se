part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class NoteColorChanged extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {
  final AddNoteResponse response;

  AddNoteSuccess(this.response);
}

class AddNoteFailure extends AddNoteState {
  final Failure failure;

  AddNoteFailure(this.failure);
}
