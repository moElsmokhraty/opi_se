import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/no_param_use_case.dart';
import '../../data/models/requests_models/get_match_requests_response/get_match_requests_response.dart';

class GetMatchRequestsUseCase extends UseCase {
  final RequestsRepo _matchRequestRepository;

  GetMatchRequestsUseCase(this._matchRequestRepository);

  @override
  Future<Either<Failure, GetMatchRequestsResponse>> call() async {
    return await _matchRequestRepository.getMatchRequests();
  }
}
