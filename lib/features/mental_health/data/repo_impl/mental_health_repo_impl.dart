import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'mental_health_api_service.dart';
import '../../../../core/errors/failure.dart';
import '../models/mental_support_request.dart';
import '../../domain/repo/mental_health_repo.dart';
import '../../../../core/errors/server_failure.dart';

class MentalHealthRepoImpl implements MentalHealthRepo {
  MentalHealthApiService mentalHealthApiService = MentalHealthApiService();

  @override
  Future<Either<Failure, List<String>>> getMentalSupport(
    MentalSupportRequest request,
  ) async {
    try {
      var response = await mentalHealthApiService.post(
        endpoint: 'mental_support',
        body: request.toJson(),
      );
      List<String> texts = response.toString().split('\\n');
      return Right(texts);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
