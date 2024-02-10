import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> deleteProfileImage();

  Future<Either<Failure, String>> changeProfileImage(XFile image);
}
