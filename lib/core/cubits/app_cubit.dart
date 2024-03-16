import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:opi_se/features/mental_health/presentation/views/mental_health_view/mental_health_view.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/notes_view.dart';
import '../../features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import '../../features/home/presentation/views/home_view/home_view.dart';
import '../utils/service_locator.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int bottomNavBarIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    BlocProvider(
      create: (context) => ChatCubit(getIt.get<GetChatUseCase>())
        ..getChat(page: 1, limit: 20)
        ..listenOnNewMessage()
        ..listenOnMessageDeleted()
        ..listenOnChatSessionRequest(context)
        ..listenOnReplyToSessionRequest(context)
        ..listenOnMatchRequestApproved(),
      child: const ChatView(),
    ),
    const NotesView(),
    const MentalHealthView(),
  ];

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarIndex());
  }
}
