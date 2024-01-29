import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/requests_models/accept_match_response.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_response.dart';
import '../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';

abstract class MatchRequestsRepo {
  Future<Either<Failure, GetMatchRequestsResponse>> getMatchRequests();

  Future<Either<Failure, DeclineMatchResponse>> declineMatchRequest(DeclineMatchRequest request);

  Future<Either<Failure, AcceptMatchResponse>> acceptMatchRequest(String partner2Id, String nationalId);
}
