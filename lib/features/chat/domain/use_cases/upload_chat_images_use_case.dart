import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/core/use_cases/use_case.dart';
import 'package:opi_se/features/chat/data/models/upload_chat_media_response.dart';
import '../repos/chat_repo.dart';

class UploadChatImagesUseCase
    extends UseCase<UploadChatMediaResponse, List<XFile>> {
  UploadChatImagesUseCase(this.chatRepo);

  final ChatRepo chatRepo;

  @override
  Future<Either<Failure, UploadChatMediaResponse>> call(param) {
    return chatRepo.uploadChatImages(mediaFiles: param);
  }
}
