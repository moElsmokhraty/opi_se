import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/constants.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../domain/repos/match_requests_repo.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/get_profile_response.dart';
import '../models/requests_models/accept_match_response.dart';
import '../models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../models/requests_models/decline_match_request_models/decline_match_response.dart';
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

  @override
  Future<Either<Failure, DeclineMatchResponse>> declineMatchRequest(
    DeclineMatchRequest request,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.declineMatchRequest,
        token: token,
        body: request.toJson(),
      );
      return Right(DeclineMatchResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AcceptMatchResponse>> acceptMatchRequest(
    String partner2Id,
    String nationalId,
  ) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.acceptMatchRequest,
        token: token,
        params: {
          'partner2Id': partner2Id,
          'nationalId': nationalId,
        },
      );
      print(data.toString());
      return Right(AcceptMatchResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetProfileResponse>> getProfile(String userId) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getProfile,
        token: token,
        params: {'userId': userId},
      );
      return Right(GetProfileResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
