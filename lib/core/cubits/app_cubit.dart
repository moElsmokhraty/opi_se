import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/chat/presentation/views/chat_view/chat_view.dart';
import '../../features/chat/presentation/views/chat_view/widgets/chat_app_bar.dart';
import '../../features/dashboard/presentation/views/progress_view/progress_view.dart';
import '../../features/dashboard/presentation/views/progress_view/widgets/progress_app_bar.dart';
import '../../features/home/presentation/views/home_view/widgets/home_app_bar.dart';
import '../../features/notes/presentation/views/notes_view/widgets/notes_app_bar.dart';
import '../../features/tasks/presentation/views/tasks_view/widgets/tasks_view_app_bar.dart';
import '../../features/home/presentation/views/home_view/home_view.dart';
import '../../features/tasks/presentation/views/tasks_view/tasks_view.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/notes_view.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int bottomNavBarIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const ProgressView(),
    const ChatView(),
    const TasksView(),
    const NotesView(),
  ];

  List<PreferredSizeWidget> appBars = [
    const HomeAppBar(),
    const ProgressAppBar(),
    const ChatAppBar(),
    const TasksViewAppBar(),
    const NotesAppBar(),
  ];

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarIndex());
  }
}
