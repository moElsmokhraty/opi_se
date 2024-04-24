import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/features/chat/data/models/get_chat_response/get_chat_response.dart';

import '../../data/models/get_chat_media_response/get_chat_media_response.dart';
import '../../data/models/upload_chat_media_response.dart';

abstract class ChatRepo {
  Future<Either<Failure, GetChatResponse>> getChat(
    String userId, {
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, GetChatMediaResponse>> getChatMedia({
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, UploadChatMediaResponse>> uploadChatImages({
    required List<XFile> mediaFiles,
  });
}
