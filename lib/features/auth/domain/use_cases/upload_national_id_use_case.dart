import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../repos/auth_repo.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/auth/data/models/register_models/upload_national_id_response.dart';

class UploadNationalIdUseCase extends UseCase<UploadNationalIdResponse, XFile> {
  UploadNationalIdUseCase(this._authRepo) : super();

  final AuthRepo _authRepo;

  @override
  Future<Either<Failure, UploadNationalIdResponse>> call(param) async {
    return await _authRepo.uploadNationalId(param);
  }
}
