part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class GetNotesLoading extends NotesState {}

class GetNotesSuccess extends NotesState {
  final GetNotesResponse response;

  GetNotesSuccess({required this.response});
}

class GetNotesFailure extends NotesState {
  final Failure failure;

  GetNotesFailure({required this.failure});
}

class PinNoteLoading extends NotesState {}

class PinNoteSuccess extends NotesState {
  final PinNoteResponse response;

  PinNoteSuccess({required this.response});
}

class PinNoteFailure extends NotesState {
  final Failure failure;

  PinNoteFailure({required this.failure});
}

class DeleteNoteLoading extends NotesState {}

class DeleteNoteSuccess extends NotesState {}

class DeleteNoteFailure extends NotesState {
  final Failure failure;

  DeleteNoteFailure({required this.failure});
}
