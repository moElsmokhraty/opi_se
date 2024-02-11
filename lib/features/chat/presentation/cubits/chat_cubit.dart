import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/core/utils/constants.dart';
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
    String? matchId, {
    int page = 1,
    int limit = 10,
  }) async {
    if (matchId == null) {
      emit(GetChatFailure('You do not have a student partner yet!'));
      return;
    }
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

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      SocketService.emit(
          eventName: 'sendMessage',
          data: {
            "messageSender": userCache!.id,
            "messageType": 'text',
            "messageContent": messageController.text,
          },
          ack: (data) {
            if (data['success'] == true) {
              print(data['data']);
              messageController.clear();
              messages.add(Message.fromJson(data['data']));
              emit(GetChatSuccess(messages));
            } else {
              emit(GetChatFailure(data['message']));
            }
          });
    }
  }

  void listenOnNewMessage() {
    SocketService.on(
        eventName: 'receiveMessage',
        handler: (eventData) {
          var message = Message.fromJson(eventData);
          messages.add(message);
          emit(GetChatSuccess(messages));
        });
  }

  void deleteMessage(Message message) {
    SocketService.emit(
        eventName: 'deleteMessage',
        data: {"messageId": message.id},
        ack: (data) {
          if (data['success'] == true) {
            messages.remove(message);
            emit(GetChatSuccess(messages));
          } else {
            emit(GetChatFailure(data['message']));
          }
        });
  }

  void listenOnMessageDeleted() {
    SocketService.on(
        eventName: 'messageDeleted',
        handler: (eventData) {
          var message = Message.fromJson(eventData);
          messages.removeWhere((element) => element.id == message.id);
          emit(GetChatSuccess(messages));
        });
  }
}
