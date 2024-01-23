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
