import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/pin_note_response.dart';
import '../../../domain/use_cases/pin_note_use_case.dart';
import '../../../domain/use_cases/get_notes_use_case.dart';
import '../../../domain/use_cases/delete_note_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../data/models/delete_note_models/delete_note_request.dart';
import '../../../data/models/delete_note_models/delete_note_response.dart';
import '../../../data/models/get_all_notes_response/get_all_notes_response.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(
    this._getNotesUseCase,
    this._pinNoteUseCase,
    this._deleteNoteUseCase,
  ) : super(NotesInitial());

  final GetNotesUseCase _getNotesUseCase;
  final PinNoteUseCase _pinNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  List<Note> notes = [];

  Future<void> getNotes(String matchId, int page, int limit) async {
    emit(GetNotesLoading());
    var result = await _getNotesUseCase.call([matchId, page, limit]);
    result.fold(
      (failure) => emit(GetNotesFailure(failure: failure)),
      (response) {
        notes.clear();
        notes.addAll(response.notes ?? []);
        emit(GetNotesSuccess(response: response));
      },
    );
  }

  Future<void> pinNote({
    required String noteId,
    required String matchId,
    required String isPinned,
  }) async {
    emit(PinNoteLoading());
    var result = await _pinNoteUseCase.call([noteId, matchId, isPinned]);
    result.fold(
      (failure) => emit(PinNoteFailure(failure: failure)),
      (response) {
        emit(PinNoteSuccess(response: response));
      },
    );
  }

  Future<void> deleteNote(DeleteNoteRequest request) async {
    emit(DeleteNoteLoading());
    var result = await _deleteNoteUseCase.call(request);
    result.fold(
      (failure) => emit(DeleteNoteFailure(failure: failure)),
      (response) {
        emit(DeleteNoteSuccess(response: response));
      },
    );
  }
}
