part of 'quiz_cubit_cubit.dart';

@immutable
sealed class QuizCubitState {}

final class QuizCubitInitial extends QuizCubitState {}

class QuizLoaded extends QuizCubitState {
  final int currentIndex;
  final int score;
  final int? selectedIndex; 

  QuizLoaded({
    required this.currentIndex,
    required this.score,
    this.selectedIndex,
  });

  QuizLoaded copyWith({
    int? currentIndex,
    int? score,
    int? selectedIndex,
  }) {
    return QuizLoaded(
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedIndex: selectedIndex,
    );
  }
}