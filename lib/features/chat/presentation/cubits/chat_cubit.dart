import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/core/utils/socket_service.dart';
import 'package:opi_se/features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../data/models/get_chat_response/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getChatUseCase) : super(ChatInitial());

  SocketService socketService = SocketService();

  final GetChatUseCase _getChatUseCase;

  TextEditingController messageController = TextEditingController();

  List<Message> messages = [];

  Future<void> getChat(
    String matchId, {
    int page = 1,
    int limit = 10,
  }) async {
    emit(GetChatLoading());
    var result = await _getChatUseCase.call({
      'matchId': matchId,
      'page': page,
      'limit': limit,
    });
    result.fold(
      (failure) => emit(GetChatFailure(failure.errMessage)),
      (response) {
        messages.addAll(response.messages ?? []);
        emit(GetChatSuccess(response.messages ?? []));
      },
    );
  }

  void sendMessage(
    String matchId,
    String messageSender,
    String messageContent,
    String messageType,
  ) {
    SocketService.emitEvent('sendMessage', {
      'matchId': matchId,
      'messageSender': messageSender,
      'messageContent': messageContent,
      'messageType': messageType,
    });
  }

  void listenOnNewMessage() {
    SocketService.listenOnEvent('newMessage', (eventData) {
      var message = Message.fromJson(eventData);
      messages.add(message);
      emit(GetChatSuccess(messages));
    });
  }
}
