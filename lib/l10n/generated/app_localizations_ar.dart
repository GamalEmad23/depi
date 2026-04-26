// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get quiz => 'اختبار';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String question_progress(Object current, Object total) {
    return 'السؤال $current/$total';
  }

  @override
  String score(Object score) {
    return 'النتيجة: $score';
  }

  @override
  String get finish_quiz => 'إنهاء الاختبار';

  @override
  String get next_question => 'السؤال التالي';

  @override
  String get error_default => 'حدث خطأ ما';

  @override
  String get app_title => 'كويز ماستر';

  @override
  String get home_ready => 'هل أنت مستعد للتحدي؟';

  @override
  String get home_desc =>
      'اختبر معلوماتك في فئات متعددة واحصل على الشارة العالمية!';

  @override
  String get start_quiz => 'ابدأ الاختبار الآن';

  @override
  String get add_question => 'إضافة أسئلة';

  @override
  String get add_question_title => 'إضافة سؤال';

  @override
  String get question_label => 'السؤال';

  @override
  String get required_field => 'مطلوب';

  @override
  String get answers_label => 'الإجابات:';

  @override
  String answer_hint(Object number) {
    return 'الإجابة $number';
  }

  @override
  String get radio_desc => 'حدد زر الاختيار بجوار الإجابة الصحيحة.';

  @override
  String get save_question => 'حفظ السؤال في فايرستور';

  @override
  String get success_add => 'تم إضافة السؤال بنجاح!';

  @override
  String error_add(Object error) {
    return 'خطأ في إضافة السؤال: $error';
  }

  @override
  String get awesome_job => 'عمل رائع!';

  @override
  String get needs_improvement => 'بحاجة إلى تحسين';

  @override
  String get mastered_desc => 'لقد أتقنت هذا الاختبار!';

  @override
  String get practice_desc => 'استمر في التدريب، ستنجح!';

  @override
  String get final_score => 'نتيجتك النهائية';

  @override
  String get play_again => 'العب مرة أخرى';

  @override
  String get back_home => 'العودة للرئيسية';

  @override
  String get change_language => 'تغيير اللغة';
}
