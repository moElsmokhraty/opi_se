import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:opi_se/features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../data/models/get_chat_response/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getChatUseCase) : super(ChatInitial());

  final GetChatUseCase _getChatUseCase;

  List<Message> messages = [];

  Future<void> getChat(
    String matchId, {
    int page = 1,
    int limit = 10,
  }) async {
    emit(GetChatLoading());
    var result = await _getChatUseCase
        .call({'matchId': matchId, 'page': page, 'limit': limit});
    result.fold(
      (failure) => emit(GetChatFailure(failure.errMessage)),
      (response) {
        messages.addAll(response.messages ?? []);
        emit(GetChatSuccess(response.messages ?? []));
      },
    );
  }
}
