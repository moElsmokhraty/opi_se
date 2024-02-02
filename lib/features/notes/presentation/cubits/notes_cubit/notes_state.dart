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
