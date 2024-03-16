part of 'chat_media_cubit.dart';

@immutable
sealed class ChatMediaState {}

final class ChatMediaInitial extends ChatMediaState {}

final class ChatMediaLoading extends ChatMediaState {}

final class ChatMediaSuccess extends ChatMediaState {
  final List<MediaItem> media;

  ChatMediaSuccess(this.media);
}

final class ChatMediaFailure extends ChatMediaState {
  final String failure;

  ChatMediaFailure(this.failure);
}
