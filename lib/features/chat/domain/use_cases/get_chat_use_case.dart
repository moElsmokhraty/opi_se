import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import 'package:opi_se/features/chat/domain/repos/chat_repo.dart';
import '../../data/models/get_chat_response/get_chat_response.dart';

class GetChatUseCase extends UseCase<GetChatResponse, Map<String, dynamic>> {
  GetChatUseCase(this.chatRepo);

  final ChatRepo chatRepo;

  @override
  Future<Either<Failure, GetChatResponse>> call(param) async {
    return await chatRepo.getChat(
      param['matchId'] as String,
      page: param['page'] as int,
      limit: param['limit'] as int,
    );
  }
}
