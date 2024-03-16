import 'package:dartz/dartz.dart';
import '../repo/mental_health_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/models/mental_support_request.dart';

class GetMentalSupportUseCase
    extends UseCase<List<String>, MentalSupportRequest> {
  GetMentalSupportUseCase(this._mentalHealthRepo);

  final MentalHealthRepo _mentalHealthRepo;

  @override
  Future<Either<Failure, List<String>>> call(param) async {
    return _mentalHealthRepo.getMentalSupport(param);
  }
}
