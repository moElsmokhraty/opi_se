import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/features/home/data/models/get_notifications_response/get_notifications_response.dart';
import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> deleteProfileImage();

  Future<Either<Failure, String>> changeProfileImage(XFile image);

  Future<Either<Failure, GetNotificationsResponse>> getUserNotifications({
    required int page,
    required int limit,
  });
}
