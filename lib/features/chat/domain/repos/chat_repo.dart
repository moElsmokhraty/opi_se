import 'package:dartz/dartz.dart';
import 'package:opi_se/core/errors/failure.dart';
import 'package:opi_se/features/chat/data/models/get_chat_response/get_chat_response.dart';

abstract class ChatRepo {
  Future<Either<Failure, GetChatResponse>> getChat(
    String userId, {
    int page = 1,
    int limit = 10,
  });
}
