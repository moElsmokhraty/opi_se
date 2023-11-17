import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'questions_state.dart';

class QuestionsCubit extends Cubit<QuestionsState> {
  QuestionsCubit() : super(QuestionsInitial());

  PageController pageController = PageController();

  List<bool> answers = [true, true, true, true];

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void setAnswer(int index, bool value) {
    answers[index] = value;
    emit(QuestionsAnswered());
  }
}
