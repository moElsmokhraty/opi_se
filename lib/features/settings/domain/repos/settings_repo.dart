import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import '../../data/models/edit_profile_request.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String>> editProfile(EditProfileRequest request);
}
