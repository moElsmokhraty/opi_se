import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/requests_models/accept_match_response.dart';
import 'package:opi_se/features/home/data/models/get_profile_response.dart';
import '../../data/models/get_partner_recommendations_response.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_response.dart';
import '../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';
import '../../data/models/requests_models/send_partner_request_response/send_partner_request_response.dart';

abstract class RequestsRepo {
  Future<Either<Failure, GetMatchRequestsResponse>> getMatchRequests();

  Future<Either<Failure, DeclineMatchResponse>> declineMatchRequest(
      DeclineMatchRequest request);

  Future<Either<Failure, AcceptMatchResponse>> acceptMatchRequest(
      String partner2Id, String nationalId);

  Future<Either<Failure, GetProfileResponse>> getProfile(String userId);

  Future<Either<Failure, GetPartnerRecommendationsResponse>>
      getPartnerRecommendations(int page);

  Future<Either<Failure, SendPartnerRequestResponse>> sendPartnerRequest(
      String userId);
}
