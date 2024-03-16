import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/use_cases/get_chat_media_use_case.dart';
import '../../../data/models/get_chat_media_response/media_item.dart';

part 'chat_media_state.dart';

class ChatMediaCubit extends Cubit<ChatMediaState> {
  ChatMediaCubit(this.getChatMediaUseCase) : super(ChatMediaInitial());

  final GetChatMediaUseCase getChatMediaUseCase;

  List<MediaItem> media = [];

  Future<void> getChatMedia({
    int page = 1,
    int limit = 10,
  }) async {
    emit(ChatMediaLoading());
    final result = await getChatMediaUseCase.call({
      'page': page,
      'limit': limit,
    });
    result.fold((failure) {
      emit(ChatMediaFailure(failure.errMessage));
    }, (response) {
      media.clear();
      media.addAll(response.media ?? []);
      emit(ChatMediaSuccess(response.media ?? []));
    });
  }
}
