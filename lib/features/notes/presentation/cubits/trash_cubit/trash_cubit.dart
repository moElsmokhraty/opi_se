import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/core/errors/server_failure.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/flush_trash_response.dart';
import '../../../domain/use_cases/get_trash_use_case.dart';
import '../../../domain/use_cases/flush_trash_use_case.dart';
import '../../../domain/use_cases/restore_note_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../domain/use_cases/delete_note_from_trash_use_case.dart';
import '../../../data/models/get_trash_response/get_trash_response.dart';
import '../../../data/models/restore_note_models/restore_note_request.dart';
import '../../../data/models/delete_note_from_trash_models/delete_note_from_trash_request.dart';
import '../../../data/models/delete_note_from_trash_models/delete_note_from_trash_response.dart';

part 'trash_state.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit(
    this._getTrashUseCase,
    this._flushTrashUseCase,
    this._deleteNoteFromTrashUseCase,
    this._restoreNoteUseCase,
  ) : super(TrashInitial());

  final GetTrashUseCase _getTrashUseCase;

  final FlushTrashUseCase _flushTrashUseCase;

  final DeleteNoteFromTrashUseCase _deleteNoteFromTrashUseCase;

  final RestoreNoteUseCase _restoreNoteUseCase;

  final List<Note> trash = [];

  Future<void> getTrash({
    int page = 1,
    int limit = 10,
  }) async {
    emit(GetTrashLoading());
    var result = await _getTrashUseCase.call([page, limit]);
    result.fold(
      (failure) => emit(GetTrashFailure(failure: failure)),
      (response) {
        trash.clear();
        trash.addAll(response.trash ?? []);
        emit(GetTrashSuccess(response: response));
      },
    );
  }

  Future<void> flushTrash() async {
    emit(FlushTrashLoading());
    var result = await _flushTrashUseCase.call();
    result.fold(
      (failure) => emit(FlushTrashFailure(failure: failure)),
      (response) {
        trash.clear();
        emit(FlushTrashSuccess(response: response));
      },
    );
  }

  Future<void> deleteNoteFromTrash(DeleteNoteFromTrashRequest request) async {
    emit(DeleteNoteFromTrashLoading());
    var result = await _deleteNoteFromTrashUseCase.call(request);
    result.fold(
      (failure) => emit(DeleteNoteFromTrashFailure(failure: failure)),
      (response) => emit(DeleteNoteFromTrashSuccess(response: response)),
    );
  }

  Future<void> restoreNoteSocket(Note note) async {
    SocketService.emit(
      eventName: 'restoreNote',
      data: note.toJson(),
      ack: (data) {
        if (data['success'] == true) {
          emit(RestoreNoteSuccess());
        } else {
          emit(RestoreNoteFailure(
            failure: ServerFailure(errMessage: 'Error while restoring note'),
          ));
        }
      },
    );
  }

  Future<void> restoreNote(RestoreNoteRequest request) async {
    emit(RestoreNoteLoading());
    var result = await _restoreNoteUseCase.call(request);
    result.fold(
      (failure) => emit(RestoreNoteFailure(failure: failure)),
      (response) => emit(RestoreNoteSuccess()),
    );
  }
}
