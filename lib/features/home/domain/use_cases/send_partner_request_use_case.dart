import 'package:dartz/dartz.dart';
import '../repos/match_requests_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/requests_models/send_partner_request_response/send_partner_request_response.dart';

class SendPartnerRequestsUseCase
    extends UseCase<SendPartnerRequestResponse, String> {
  final RequestsRepo _matchRequestRepository;

  SendPartnerRequestsUseCase(this._matchRequestRepository);

  @override
  Future<Either<Failure, SendPartnerRequestResponse>> call(param) async {
    return await _matchRequestRepository.sendPartnerRequest(param);
  }
}
