import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../models/get_profile_response.dart';
import '../../../../core/utils/constants.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../domain/repos/match_requests_repo.dart';
import '../../../../core/utils/api_config/api_config.dart';
import '../../../../core/utils/api_config/api_service.dart';
import '../models/get_partner_recommendations_response.dart';
import '../models/requests_models/accept_match_response.dart';
import '../models/requests_models/decline_match_request_models/decline_match_request.dart';
import '../models/requests_models/decline_match_request_models/decline_match_response.dart';
import '../models/requests_models/get_match_requests_response/get_match_requests_response.dart';
import '../models/requests_models/send_partner_request_response/send_partner_request_response.dart';

class RequestsRepoImpl implements RequestsRepo {
  final ApiService _apiService;

  RequestsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, GetMatchRequestsResponse>> getMatchRequests() async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getMatchRequests,
        token: userCache!.token!,
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
        token: userCache!.token!,
        deviceToken: fcmToken,
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
        token: userCache!.token!,
        deviceToken: fcmToken,
        params: {
          'partner2Id': partner2Id,
          'nationalId': nationalId,
        },
      );
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
        token: userCache!.token!,
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

  @override
  Future<Either<Failure, GetPartnerRecommendationsResponse>>
      getPartnerRecommendations(int page) async {
    try {
      var data = await _apiService.get(
        endpoint: APIConfig.getPartnerRecommendations,
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzQyYjRkYzRlMmUxMmFlNzI1MzYzZiIsInVzZXJOYW1lIjoibW9oYW1lZDI5IiwiZW1haWwiOiJjb2dhcmFmODgwQGxheW1yby5jb20iLCJuYXRpb25hbElkIjoiMTI0MzM0MjM0MzE0NiIsImlhdCI6MTcwNzM1NDk5Nn0.PdL-YkatFty6mnrG1AIl45zjw0nGKzKNf0KVVw4bJMo',
        params: {'page': page},
      );
      return Right(GetPartnerRecommendationsResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SendPartnerRequestResponse>> sendPartnerRequest(
      String userId) async {
    try {
      var data = await _apiService.post(
        endpoint: APIConfig.sendPartnerRequest,
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzQyYjRkYzRlMmUxMmFlNzI1MzYzZiIsInVzZXJOYW1lIjoibW9oYW1lZDI5IiwiZW1haWwiOiJjb2dhcmFmODgwQGxheW1yby5jb20iLCJuYXRpb25hbElkIjoiMTI0MzM0MjM0MzE0NiIsImlhdCI6MTcwNzM1NDk5Nn0.PdL-YkatFty6mnrG1AIl45zjw0nGKzKNf0KVVw4bJMo',
        deviceToken: fcmToken,
        params: {'userId': userId},
      );
      return Right(SendPartnerRequestResponse.fromJson(data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
