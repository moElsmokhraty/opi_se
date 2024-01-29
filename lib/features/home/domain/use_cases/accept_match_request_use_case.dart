import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/requests_models/accept_match_response.dart';

class AcceptMatchRequestsUseCase extends UseCase<AcceptMatchResponse, List<String>> {
  final MatchRequestsRepo _matchRequestRepository;

  AcceptMatchRequestsUseCase(this._matchRequestRepository);

  @override
  Future<Either<Failure, AcceptMatchResponse>> call(param) async {
    return await _matchRequestRepository.acceptMatchRequest(
      param[0],
      param[1],
    );
  }
}
