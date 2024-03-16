import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/socket_service.dart';
import '../../../data/models/get_chat_response/message.dart';
import '../../../domain/use_cases/get_chat_use_case.dart';
import '../../views/chat_view/widgets/chat_session_req_dialog.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getChatUseCase) : super(ChatInitial());

  final GetChatUseCase _getChatUseCase;

  TextEditingController messageController = TextEditingController();

  List<Message> messages = [];

  bool showMediaOptions = false;

  void toggleMediaOptions() {
    if (userCache?.matchId == null) return;
    showMediaOptions = !showMediaOptions;
    emit(ChatMediaOptionsToggled());
  }

  Future<void> getChat({
    int page = 1,
    int limit = 10,
  }) async {
    if (userCache?.matchId == null) {
      emit(GetChatFailure('You do not have a student partner yet!'));
      return;
    }
    emit(GetChatLoading());
    var result = await _getChatUseCase.call({
      'matchId': userCache?.matchId,
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
    if (userCache?.matchId == null) return;
    if (messageController.text.trim().isNotEmpty) {
      print(messageController.text);
      print(userCache?.matchId);
      SocketService.emit(
          eventName: 'sendMessage',
          data: {
            "messageType": 'text',
            "messageContent": messageController.text,
          },
          ack: (data) {
            if (data['success'] == true) {
              print(data.toString());
              messageController.clear();
              messages.insert(
                  0,
                  Message(
                    id: data['data']['_id'],
                    messageContent: data['data']['messageContent'],
                    messageSender: data['data']['messageSender'],
                    messageType: data['data']['messageType'],
                    sentAt: DateTime.now(),
                  ));
              emit(GetChatSuccess(messages));
            } else {
              print(data.toString());
              emit(GetChatFailure(data['message']));
            }
          });
    }
  }

  void listenOnNewMessage() {
    if (userCache?.matchId == null) return;
    SocketService.on(
        eventName: 'receiveMessage',
        handler: (data) {
          print('detected new message: $data');
          messages.insert(
              0,
              Message(
                id: data['data']['_id'],
                messageContent: data['data']['messageContent'],
                messageSender: data['data']['messageSender'],
                messageType: data['data']['messageType'],
                sentAt: DateTime.now().toLocal(),
              ));
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
    if (userCache?.matchId == null) return;
    SocketService.on(
        eventName: 'messageDeleted',
        handler: (eventData) {
          print('detected message deleted: $eventData');
          messages.removeWhere((element) => element.id == eventData);
          emit(GetChatSuccess(messages));
        });
  }

  void startChatSession(BuildContext context) {
    SocketService.emit(
      eventName: 'startChatSession',
      data: {
        "chatSessionRequest": true,
        "sessionStartTime": DateTime.now().toLocal().toString(),
      },
      ack: (data) {
        if (data['success'] == true) {
          showCustomSnackBar(context, data['message']);
        } else {
          showCustomSnackBar(context, data['message']);
        }
      },
    );
  }

  void listenOnChatSessionRequest(BuildContext context) {
    if (userCache?.matchId == null) return;
    SocketService.on(
        eventName: 'newChatSessionRequest',
        handler: (eventData) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const ChatSessionReqDialog();
              });
        });
  }

  void replyToSessionRequest(bool accept, BuildContext context) {
    SocketService.emit(
      eventName: 'replyToSessionRequest',
      data: {"accept": accept},
      ack: (data) {
        if (data['success'] == true) {
          showCustomSnackBar(
            context,
            accept
                ? 'You accepted chat session request!'
                : 'You rejected chat session request!',
          );
        } else {
          showCustomSnackBar(context, data['message']);
        }
      },
    );
  }

  void listenOnReplyToSessionRequest(BuildContext context) {
    if (userCache?.matchId == null) return;
    SocketService.on(
        eventName: 'replyToRequest',
        handler: (eventData) {
          print('Event data: ${eventData.toString()}');
          if (eventData['data']['accept'] == true) {
            showCustomSnackBar(
              context,
              'Chat session request accepted!',
            );
          } else {
            showCustomSnackBar(
              context,
              'Chat session request rejected!',
            );
          }
        });
  }

  void listenOnMatchRequestApproved() {
    if (userCache?.matchId == null) return;
    SocketService.on(
        eventName: 'matchRequestApproved',
        handler: (eventData) {
          Future.delayed(const Duration(seconds: 1), () async {
            await getChat();
          });
        });
  }
}
