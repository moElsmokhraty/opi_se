import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';

abstract class MatchRequestsRepo {
  Future<Either<Failure, GetMatchRequestsResponse>> getMatchRequests();
}
