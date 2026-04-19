// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_03/features/quiz_app/models/quiz_model.dart';
import 'package:meta/meta.dart';

part 'quiz_cubit_state.dart';

class QuizCubit extends Cubit<QuizCubitState> {
  QuizCubit() : super(QuizCubitInitial()) {
    fetchQuestions();
  }
  
  List<QuizModel> data = [];

  Future<void> fetchQuestions() async {
    emit(QuizLoading());
    try {
      final snapshot = await FirebaseFirestore.instance.collection('questions').get();
      if (snapshot.docs.isEmpty) {
        emit(QuizError('No questions found in Firestore.'));
        return;
      }
      data = snapshot.docs.map((doc) => QuizModel.fromMap(doc.data())).toList();
      emit(QuizLoaded(currentIndex: 0, score: 0));
    } catch (e) {
      emit(QuizError('Failed to fetch questions: $e'));
    }
  }

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
    emit(QuizLoaded(
      currentIndex: 0,
      score: 0,
      selectedIndex: null,
    ));
    // If you want to refetch on reset, you could call fetchQuestions() here instead.
  }
}


