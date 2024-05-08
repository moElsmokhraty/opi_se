import 'package:dartz/dartz.dart';
import '../repos/profile_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import '../../data/models/get_notifications_response/get_notifications_response.dart';

class GetNotificationsUseCase
    extends UseCase<GetNotificationsResponse, Map<String, int>> {
  final ProfileRepo _profileRepo;

  GetNotificationsUseCase(this._profileRepo);

  @override
  Future<Either<Failure, GetNotificationsResponse>> call(param) async {
    return await _profileRepo.getUserNotifications(
      page: param['page']!,
      limit: param['limit']!,
    );
  }
}
