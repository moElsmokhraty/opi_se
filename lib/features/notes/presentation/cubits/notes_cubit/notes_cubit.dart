import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/get_all_notes_response/get_all_notes_response.dart';
import '../../../domain/use_cases/get_notes_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this._getNotesUseCase) : super(NotesInitial());

  final GetNotesUseCase _getNotesUseCase;

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
}
