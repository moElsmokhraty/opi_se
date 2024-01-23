import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repos/match_requests_repo.dart';
import '../models/requests_models/get_match_requests_response/get_match_requests_response.dart';

class MatchRequestsRepoImpl implements MatchRequestsRepo {
  final ApiService _apiService;

  MatchRequestsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetMatchRequestsResponse>> getMatchRequests() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getMatchRequests,
        token: token,
      );
      return Right(GetMatchRequestsResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
