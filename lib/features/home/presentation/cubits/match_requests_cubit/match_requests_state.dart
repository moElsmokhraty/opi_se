part of 'match_requests_cubit.dart';

@immutable
abstract class MatchRequestsState {}

class MatchRequestsInitial extends MatchRequestsState {}

class GetMatchRequestsLoading extends MatchRequestsState {}

class GetMatchRequestsSuccess extends MatchRequestsState {
  final GetMatchRequestsResponse response;

  GetMatchRequestsSuccess(this.response);
}

class GetMatchRequestsFailure extends MatchRequestsState {
  final Failure failure;

  GetMatchRequestsFailure(this.failure);
}

class DeclineMatchRequestLoading extends MatchRequestsState {}

class DeclineMatchRequestSuccess extends MatchRequestsState {
  final DeclineMatchResponse response;

  DeclineMatchRequestSuccess(this.response);
}

class DeclineMatchRequestFailure extends MatchRequestsState {
  final Failure failure;

  DeclineMatchRequestFailure(this.failure);
}

class AcceptMatchRequestLoading extends MatchRequestsState {}

class AcceptMatchRequestSuccess extends MatchRequestsState {
  final AcceptMatchResponse response;

  AcceptMatchRequestSuccess(this.response);
}

class AcceptMatchRequestFailure extends MatchRequestsState {
  final Failure failure;

  AcceptMatchRequestFailure(this.failure);
}

class GetProfileLoading extends MatchRequestsState {}

class GetProfileSuccess extends MatchRequestsState {
  final GetProfileResponse response;

  GetProfileSuccess(this.response);
}

class GetProfileFailure extends MatchRequestsState {
  final Failure failure;

  GetProfileFailure(this.failure);
}