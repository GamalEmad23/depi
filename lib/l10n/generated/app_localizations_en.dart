// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get quiz => 'Quiz';

  @override
  String get retry => 'Retry';

  @override
  String question_progress(Object current, Object total) {
    return 'Question $current/$total';
  }

  @override
  String score(Object score) {
    return 'Score: $score';
  }

  @override
  String get finish_quiz => 'Finish Quiz';

  @override
  String get next_question => 'Next Question';

  @override
  String get error_default => 'Something went wrong';

  @override
  String get app_title => 'QuizMaster';

  @override
  String get home_ready => 'Ready for a challenge?';

  @override
  String get home_desc =>
      'Test your knowledge across multiple categories and claim the global badge!';

  @override
  String get start_quiz => 'Start Quiz Now';

  @override
  String get add_question => 'Add Questions';

  @override
  String get add_question_title => 'Add Question';

  @override
  String get question_label => 'Question';

  @override
  String get required_field => 'Required';

  @override
  String get answers_label => 'Answers:';

  @override
  String answer_hint(Object number) {
    return 'Answer $number';
  }

  @override
  String get radio_desc =>
      'Select the radio button next to the correct answer.';

  @override
  String get save_question => 'Save Question to Firestore';

  @override
  String get success_add => 'Question added successfully!';

  @override
  String error_add(Object error) {
    return 'Error adding question: $error';
  }

  @override
  String get awesome_job => 'Awesome Job!';

  @override
  String get needs_improvement => 'Needs Improvement';

  @override
  String get mastered_desc => 'You mastered this quiz!';

  @override
  String get practice_desc => 'Keep practicing, you\'ll get it!';

  @override
  String get final_score => 'Your Final Score';

  @override
  String get play_again => 'Play Again';

  @override
  String get back_home => 'Back to Home';

  @override
  String get change_language => 'Change Language';
}
