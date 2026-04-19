
class QuizModel {
  final String question;
  final List answers;
  final int correctAnswerIndex;

  QuizModel({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] ?? '',
      answers: List<String>.from(map['answers'] ?? []),
      correctAnswerIndex: map['correctAnswerIndex']?.toInt() ?? 0,
    );
  }
}