import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/mental_support_request.dart';

abstract class MentalHealthRepo {
  Future<Either<Failure, List<String>>> getMentalSupport(
      MentalSupportRequest request);
}
