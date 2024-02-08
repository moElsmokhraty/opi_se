import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, dynamic>> editProfile(dynamic request);
}
