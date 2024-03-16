import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/pin_note_response.dart';
import '../../../domain/use_cases/get_notes_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../data/models/get_all_notes_response/get_all_notes_response.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this._getNotesUseCase) : super(NotesInitial());

  final GetNotesUseCase _getNotesUseCase;

  List<Note> notes = [];

  Future<void> getNotes(String? matchId, int page, int limit) async {
    if (matchId == null) {
      emit(
        GetNotesFailure(
          failure: ServerFailure(
            errMessage: 'You do not have a student partner yet!',
          ),
        ),
      );
      return;
    }
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

  void pinNote({required String noteId}) {
    SocketService.emit(
      eventName: 'pinNote',
      data: {'noteId': noteId},
      ack: (data) {
        if (data['success'] == true) {
          for (var note in notes) {
            if (note.id == noteId) {
              note.isPinned = !note.isPinned!;
              emit(PinNoteSuccess(response: PinNoteResponse(note: note)));
              break;
            }
          }
        } else {
          emit(PinNoteFailure(
            failure: ServerFailure(errMessage: 'Error while pinning note!'),
          ));
        }
      },
    );
  }

  void deleteNote({required String noteId}) {
    SocketService.emit(
      eventName: 'noteDeleted',
      data: {'noteId': noteId},
      ack: (data) {
        if (data['success'] == true) {
          for (var note in notes) {
            if (note.id == noteId) {
              notes.remove(note);
              emit(DeleteNoteSuccess());
              break;
            }
          }
        } else {
          emit(DeleteNoteFailure(
            failure: ServerFailure(errMessage: 'Error while deleting note!'),
          ));
        }
      },
    );
  }

  void listenOnNewNote() {
    SocketService.on(
      eventName: 'getNote',
      handler: (newNote) {
        print('new note: $newNote');

        Note note = Note(
          noteTitle: newNote['data']['noteTitle'],
          noteContent: newNote['data']['noteContent'],
          noteColor: noteColors[newNote['data']['noteColor']]?.value.toString(),
          isPinned: false,
        );
        notes.insert(0, note);
        emit(GetNotesSuccess(response: GetNotesResponse(notes: notes)));
      },
    );
  }

  void listenOnNoteDeleted() {
    SocketService.on(
      eventName: 'noteDeleted',
      handler: (deletedNote) {
        for (var note in notes) {
          if (note.id == deletedNote['data']['noteId']) {
            notes.remove(note);
            emit(DeleteNoteSuccess());
            break;
          }
        }
      },
    );
  }

  void listenOnNotePinned() {
    SocketService.on(
      eventName: 'notePinned',
      handler: (pinnedNote) {
        for (var note in notes) {
          if (note.id == pinnedNote['data']['noteId']) {
            note.isPinned = !note.isPinned!;
            emit(PinNoteSuccess(response: PinNoteResponse(note: note)));
            break;
          }
        }
      },
    );
  }

  void listenOnNoteRestored() {
    SocketService.on(
      eventName: 'noteRestored',
      handler: (restoredNote) {
        notes.insert(0, Note.fromJson(restoredNote['data']));
        emit(GetNotesSuccess(response: GetNotesResponse(notes: notes)));
      },
    );
  }
}
