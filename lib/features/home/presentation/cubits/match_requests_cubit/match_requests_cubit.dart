import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/get_match_requests_use_case.dart';
import '../../../domain/use_cases/accept_match_request_use_case.dart';
import '../../../domain/use_cases/decline_match_request_use_case.dart';
import '../../../data/models/requests_models/accept_match_response.dart';
import '../../../data/models/requests_models/get_match_requests_response/partner_request.dart';
import '../../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../../../data/models/requests_models/decline_match_request_models/decline_match_response.dart';
import '../../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';

part 'match_requests_state.dart';

class MatchRequestsCubit extends Cubit<MatchRequestsState> {
  MatchRequestsCubit(
    this._getMatchRequestsUseCase,
    this._declineMatchRequestUseCase,
    this._acceptMatchRequestsUseCase,
  ) : super(MatchRequestsInitial());

  final GetMatchRequestsUseCase _getMatchRequestsUseCase;

  final DeclineMatchRequestUseCase _declineMatchRequestUseCase;

  final AcceptMatchRequestsUseCase _acceptMatchRequestsUseCase;

  List<PartnerRequest> partnerRequests = [];

  Future<void> getMatchRequests() async {
    emit(GetMatchRequestsLoading());
    final result = await _getMatchRequestsUseCase.call();
    result.fold(
      (failure) => emit(GetMatchRequestsFailure(failure)),
      (response) {
        partnerRequests.clear();
        partnerRequests.addAll(response.data?.partnerRequests ?? []);
        emit(GetMatchRequestsSuccess(response));
      },
    );
  }

  Future<void> declineMatchRequest(DeclineMatchRequest request) async {
    emit(DeclineMatchRequestLoading());
    final result = await _declineMatchRequestUseCase.call(request);
    result.fold(
      (failure) => emit(DeclineMatchRequestFailure(failure)),
      (response) => emit(DeclineMatchRequestSuccess(response)),
    );
  }

  Future<void> acceptMatchRequest(String partnerId, String nationalID) async {
    emit(AcceptMatchRequestLoading());
    final result = await _acceptMatchRequestsUseCase.call([partnerId, nationalID]);
    result.fold(
      (failure) => emit(AcceptMatchRequestFailure(failure)),
      (response) => emit(AcceptMatchRequestSuccess(response)),
    );
  }
}
