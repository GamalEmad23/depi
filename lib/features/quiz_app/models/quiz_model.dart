
class QuizModel {
  final String question;
  final List answers;
  final int correctAnswerIndex;

  QuizModel({required this.question, required this.answers, required this.correctAnswerIndex});
}
List<QuizModel> questions = [
  QuizModel(
    question: "What is Flutter?",
    answers: [
      "Programming Language",
      "Framework",
      "Database",
      "Operating System"
    ],
    correctAnswerIndex: 1,
  ),
  QuizModel(
    question: "Who developed Dart?",
    answers: [
      "Microsoft",
      "Apple",
      "Google",
      "Facebook"
    ],
    correctAnswerIndex: 2,
  ),
  QuizModel(
    question: "Which widget is immutable?",
    answers: [
      "StatefulWidget",
      "StatelessWidget",
      "Container",
      "Scaffold"
    ],
    correctAnswerIndex: 1,
  ),
  QuizModel(
    question: "Which function is the entry point in Dart?",
    answers: [
      "start()",
      "init()",
      "main()",
      "run()"
    ],
    correctAnswerIndex: 2,
  ),
  QuizModel(
    question: "Which company created Flutter?",
    answers: [
      "Amazon",
      "Google",
      "Meta",
      "IBM"
    ],
    correctAnswerIndex: 1,
  ),
  QuizModel(
    question: "Which widget is used for layouts in rows?",
    answers: [
      "Column",
      "Stack",
      "Row",
      "ListView"
    ],
    correctAnswerIndex: 2,
  ),
  QuizModel(
    question: "Hot Reload is used for?",
    answers: [
      "Restart device",
      "Update UI instantly",
      "Delete cache",
      "Compile app"
    ],
    correctAnswerIndex: 1,
  ),
  QuizModel(
    question: "Which keyword defines a constant variable?",
    answers: [
      "var",
      "final",
      "const",
      "let"
    ],
    correctAnswerIndex: 2,
  ),
  QuizModel(
    question: "Which widget provides app structure?",
    answers: [
      "Text",
      "Scaffold",
      "Icon",
      "SizedBox"
    ],
    correctAnswerIndex: 1,
  ),
  QuizModel(
    question: "Dart is mainly used for?",
    answers: [
      "Machine Learning",
      "Mobile App Development",
      "Game Engine",
      "Blockchain"
    ],
    correctAnswerIndex: 1,
  ),
];