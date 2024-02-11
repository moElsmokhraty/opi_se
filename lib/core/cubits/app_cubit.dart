import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opi_se/features/chat/presentation/views/chat_view/chat_view.dart';
import 'package:opi_se/features/notes/presentation/views/notes_view/notes_view.dart';
import '../../features/home/presentation/views/home_view/home_view.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int bottomNavBarIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const ChatView(),
    const NotesView(),
  ];



  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex = index;
    emit(AppChangeBottomNavBarIndex());
  }
}
