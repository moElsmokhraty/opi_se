import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/chat/domain/use_cases/upload_chat_images_use_case.dart';
import '../utils/service_locator.dart';
import '../../features/chat/domain/use_cases/get_chat_use_case.dart';
import '../../features/home/presentation/views/home_view/home_view.dart';
import '../../features/tasks/presentation/views/tasks_view/tasks_view.dart';
import '../../features/chat/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:opi_se/features/tasks/domain/use_cases/delete_task_use_case.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/notes_view.dart';
import '../../features/tasks/domain/use_cases/get_specific_tasks_type_use_case.dart';
import 'package:opi_se/features/tasks/presentation/cubits/tasks_cubit/tasks_cubit.dart';
import '../../features/mental_health/presentation/views/mental_health_view/mental_health_view.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int bottomNavBarIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    //const DashboardView(),
    BlocProvider(
      create: (context) => ChatCubit(
        getIt.get<GetChatUseCase>(),
        getIt.get<UploadChatImagesUseCase>(),
      )
        ..getChat(page: 1, limit: 20)
        ..listenOnNewMessage()
        ..listenOnMessageDeleted()
        ..listenOnChatSessionRequest(context)
        ..listenOnReplyToSessionRequest(context)
        ..listenOnMatchRequestApproved(),
      child: const ChatView(),
    ),
    BlocProvider(
      create: (context) => TasksCubit(
        getIt.get<GetSpecificTasksTypeUseCase>(),
        getIt.get<DeleteTaskUseCase>(),
      )
        ..getTodoTasks()
        ..getInProgressTasks()
        ..getDoneTasks(),
      child: const TasksView(),
    ),
    const NotesView(),
    const MentalHealthView(),
  ];

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarIndex());
  }
}
