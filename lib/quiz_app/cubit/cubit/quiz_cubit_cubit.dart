// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:depi_03/quiz_app/models/quiz_model.dart';
import 'package:meta/meta.dart';

part 'quiz_cubit_state.dart';

class QuizCubit extends Cubit<QuizCubitState> {
  QuizCubit() : super(QuizLoaded(currentIndex: 0, score: 0));
  var data = questions;

  QuizModel get getCurrentQuestions {
    return data[(state as QuizLoaded).currentIndex];
  }

  List<dynamic> get getAnswers {
    return getCurrentQuestions.answers;
  }

  void answerQuestion(int index) {
    final currentState = state as QuizLoaded;

    int newScore = currentState.score;

    if (index == getCurrentQuestions.correctAnswerIndex) {
      newScore++;
    }

    emit(
      QuizLoaded(
        currentIndex: currentState.currentIndex,
        score: newScore,
        selectedIndex: index,
      ),
    );
  }

  void nextQuestion(int index) {
    final currentState = state as QuizLoaded;

    if (currentState.currentIndex + 1 < data.length) {
      emit(
        QuizLoaded(
          currentIndex: currentState.currentIndex + 1,
          score: currentState.score,
          selectedIndex: null,
        ),
      );
    }
  }

  void selectAnswer(int index) {
    final currentState = state as QuizLoaded;

    emit(currentState.copyWith(selectedIndex: index));
  }

    int get myScore{
    final currentState = state as QuizLoaded;
    return currentState.score;
  }

  void resetQuiz() {
  emit(
    QuizLoaded(
      currentIndex: 0,
      score: 0,
      selectedIndex: null,
    ),
  );
}
}


