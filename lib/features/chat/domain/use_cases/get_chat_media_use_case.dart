import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import 'package:opi_se/features/chat/domain/repos/chat_repo.dart';
import '../../data/models/get_chat_media_response/get_chat_media_response.dart';

class GetChatMediaUseCase
    extends UseCase<GetChatMediaResponse, Map<String, dynamic>> {
  GetChatMediaUseCase(this.chatRepo);

  final ChatRepo chatRepo;

  @override
  Future<Either<Failure, GetChatMediaResponse>> call(param) async {
    return await chatRepo.getChatMedia(
      page: param['page'] as int,
      limit: param['limit'] as int,
    );
  }
}
