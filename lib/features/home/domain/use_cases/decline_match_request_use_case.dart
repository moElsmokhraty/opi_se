import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../../data/models/requests_models/decline_match_request_models/decline_match_response.dart';

class DeclineMatchRequestUseCase
    extends UseCase<DeclineMatchResponse, DeclineMatchRequest> {
  final RequestsRepo _matchRequestRepository;

  DeclineMatchRequestUseCase(this._matchRequestRepository);

  @override
  Future<Either<Failure, DeclineMatchResponse>> call(param) async {
    return await _matchRequestRepository.declineMatchRequest(param);
  }
}
