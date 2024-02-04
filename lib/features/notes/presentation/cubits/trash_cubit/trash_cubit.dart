import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/get_trash_use_case.dart';
import '../../../domain/use_cases/flush_trash_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../data/models/get_trash_response/get_trash_response.dart';
import 'package:opi_se/features/notes/data/models/flush_trash_response.dart';

part 'trash_state.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit(
    this._getTrashUseCase,
    this._flushTrashUseCase,
  ) : super(TrashInitial());

  final GetTrashUseCase _getTrashUseCase;

  final FlushTrashUseCase _flushTrashUseCase;

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
}
