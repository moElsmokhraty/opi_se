import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/get_profile_response.dart';

class GetProfileUseCase extends UseCase<GetProfileResponse, String> {
  final MatchRequestsRepo _matchRequestRepository;

  GetProfileUseCase(this._matchRequestRepository);

  @override
  Future<Either<Failure, GetProfileResponse>> call(param) async {
    return await _matchRequestRepository.getProfile(param);
  }
}
