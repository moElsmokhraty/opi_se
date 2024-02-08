part of 'partner_recommendations_cubit.dart';

@immutable
abstract class PartnerRecommendationsState {}

class PartnerRecommendationsInitial extends PartnerRecommendationsState {}

class GetPartnerRecommendationsLoading extends PartnerRecommendationsState {}

class GetPartnerRecommendationsSuccess extends PartnerRecommendationsState {
  final GetPartnerRecommendationsResponse response;

  GetPartnerRecommendationsSuccess(this.response);
}

class GetPartnerRecommendationsFailure extends PartnerRecommendationsState {
  final Failure failure;

  GetPartnerRecommendationsFailure(this.failure);
}

class SendPartnerRequestLoading extends PartnerRecommendationsState {}

class SendPartnerRequestSuccess extends PartnerRecommendationsState {
  final SendPartnerRequestResponse response;

  SendPartnerRequestSuccess(this.response);
}

class SendPartnerRequestFailure extends PartnerRecommendationsState {
  final Failure failure;

  SendPartnerRequestFailure(this.failure);
}
