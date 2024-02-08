import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/send_partner_request_use_case.dart';
import '../../../data/models/get_partner_recommendations_response.dart';
import '../../../domain/use_cases/get_partner_recommendations_use_case.dart';
import '../../../../auth/data/models/login_models/login_response/user_data.dart';
import '../../../data/models/requests_models/send_partner_request_response/send_partner_request_response.dart';

part 'partner_recommendations_state.dart';

class PartnerRecommendationsCubit extends Cubit<PartnerRecommendationsState> {
  PartnerRecommendationsCubit(
    this._getPartnerRecommendationsUseCase,
    this._sendPartnerRequestsUseCase,
  ) : super(PartnerRecommendationsInitial());

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  final GetPartnerRecommendationsUseCase _getPartnerRecommendationsUseCase;

  final SendPartnerRequestsUseCase _sendPartnerRequestsUseCase;

  List<UserData> recommendations = [];

  PageController pageController = PageController();

  Future<void> getPartnerRecommendations({int page = 1}) async {
    emit(GetPartnerRecommendationsLoading());
    final result = await _getPartnerRecommendationsUseCase.call(page);
    result.fold(
      (failure) => emit(GetPartnerRecommendationsFailure(failure)),
      (response) {
        recommendations.clear();
        recommendations.addAll(response.recommendations ?? []);
        emit(GetPartnerRecommendationsSuccess(response));
      },
    );
  }

  Future<void> sendPartnerRequest(String userId) async {
    emit(SendPartnerRequestLoading());
    final result = await _sendPartnerRequestsUseCase.call(userId);
    result.fold(
      (failure) => emit(SendPartnerRequestFailure(failure)),
      (response) => emit(SendPartnerRequestSuccess(response)),
    );
  }
}
