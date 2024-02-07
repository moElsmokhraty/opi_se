import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/requests_models/get_partner_recommendations_response.dart';

class GetPartnerRecommendationsUseCase
    extends UseCase<GetPartnerRecommendationsResponse, int> {
  final RequestsRepo _requestRepository;

  GetPartnerRecommendationsUseCase(this._requestRepository);

  @override
  Future<Either<Failure, GetPartnerRecommendationsResponse>> call(param) async {
    return await _requestRepository.getPartnerRecommendations(param);
  }
}
