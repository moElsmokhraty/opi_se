part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class GetChatLoading extends ChatState {}

class GetChatSuccess extends ChatState {
  final List<Message> messages;

  GetChatSuccess(this.messages);
}

class GetChatFailure extends ChatState {
  final String message;

  GetChatFailure(this.message);
}

class ChatMediaOptionsToggled extends ChatState {}
