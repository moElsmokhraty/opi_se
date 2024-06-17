import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/features/auth/data/models/login_models/login_response/user_data.dart';
import '../../../../../core/cache/hive_helper.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/get_profile_response.dart';
import '../../../domain/use_cases/get_profile_use_case.dart';
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
    this._getProfileUseCase,
  ) : super(MatchRequestsInitial());

  final GetMatchRequestsUseCase _getMatchRequestsUseCase;

  final DeclineMatchRequestUseCase _declineMatchRequestUseCase;

  final AcceptMatchRequestsUseCase _acceptMatchRequestsUseCase;

  final GetProfileUseCase _getProfileUseCase;

  UserData? userData;

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
    final result =
        await _acceptMatchRequestsUseCase.call([partnerId, nationalID]);
    result.fold(
      (failure) => emit(AcceptMatchRequestFailure(failure)),
      (response) => emit(AcceptMatchRequestSuccess(response)),
    );
  }

  Future<void> getProfile(String userId) async {
    emit(GetProfileLoading());
    final result = await _getProfileUseCase.call(userId);
    result.fold(
      (failure) => emit(GetProfileFailure(failure)),
      (response) {
        userData = response.data;
        emit(GetProfileSuccess(response));
      },
    );
  }

  void emitAcceptPartnerRequest({
    required String notifiedPartner,
    required String matchId,
    required String partnerUserName,
  }) {
    SocketService.emit(
      eventName: 'acceptPartnerRequest',
      data: {
        "notifiedPartner": notifiedPartner,
        "matchId": matchId,
        "partnerUserName": partnerUserName,
        "partnerImage": "default.png",
      },
    );
  }

  void listenOnMatchRequestApproved() {
    SocketService.on(
      eventName: 'matchRequestApproved',
      handler: (eventData) async {
        await updateCache(
          notifiedPartner: eventData['notifiedPartner'],
          matchId: eventData['matchId'],
          partnerUserName: eventData['partnerUserName'],
          partnerImage: eventData['partnerImage'],
        ).then((value) async {
          await SocketService.connect();
        });
        await getMatchRequests();
      },
    );
  }

  Future<void> updateCache({
    required String notifiedPartner,
    required String matchId,
    required String partnerUserName,
    required String partnerImage,
  }) async {
    userCache!.matchId = matchId;
    userCache!.partner?.id = notifiedPartner;
    userCache!.partner?.userName = partnerUserName;
    userCache!.partner?.profileImage = partnerImage;
    await HiveHelper.updateUserCache(userCache!).then((value) async {
      await SocketService.connect();
    });
  }
}
