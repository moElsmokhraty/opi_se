import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/get_match_requests_use_case.dart';
import '../../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';

part 'match_requests_state.dart';

class MatchRequestsCubit extends Cubit<MatchRequestsState> {
  MatchRequestsCubit(
    this._getMatchRequestsUseCase,
  ) : super(MatchRequestsInitial());

  final GetMatchRequestsUseCase _getMatchRequestsUseCase;

  Future<void> getMatchRequests() async {
    emit(GetMatchRequestsLoading());
    final result = await _getMatchRequestsUseCase.call();
    result.fold(
      (failure) => emit(GetMatchRequestsFailure(failure)),
      (response) => emit(GetMatchRequestsSuccess(response)),
    );
  }
}
