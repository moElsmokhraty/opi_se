import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/get_trash_use_case.dart';
import '../../../data/models/get_all_notes_response/note.dart';
import '../../../data/models/get_trash_response/get_trash_response.dart';

part 'trash_state.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit(this._getTrashUseCase) : super(TrashInitial());

  final GetTrashUseCase _getTrashUseCase;

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
}
