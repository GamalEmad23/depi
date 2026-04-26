import 'package:depi_03/features/quiz_app/cubit/cubit/quiz_cubit_cubit.dart';
import 'package:depi_03/features/quiz_app/screen/home_screen.dart';
import 'package:depi_03/features/quiz_app/screen/quiz_screen.dart';
import 'package:depi_03/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<QuizCubit, QuizCubitState>(
            builder: (context, state) {
              if (state is QuizLoaded) {
                final int totalQuestions = cubit.data.length;
                final bool isSuccess = totalQuestions > 0 && cubit.myScore > (totalQuestions / 2);
                final double percentage = totalQuestions == 0 ? 0 : (cubit.myScore / totalQuestions);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: h * 0.18,
                      width: h * 0.18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isSuccess ? Colors.greenAccent : Colors.redAccent).withOpacity(0.5),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          isSuccess ? Icons.emoji_events_rounded : Icons.sentiment_dissatisfied_rounded,
                          color: isSuccess ? Colors.amber : Colors.redAccent,
                          size: 80,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      isSuccess ? l10n.awesome_job : l10n.needs_improvement,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isSuccess ? l10n.mastered_desc : l10n.practice_desc,
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: w * 0.85,
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            l10n.final_score,
                            style: const TextStyle(color: Colors.white70, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                "${cubit.myScore}",
                                style: TextStyle(
                                  color: isSuccess ? Colors.greenAccent : Colors.redAccent,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                " / $totalQuestions",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${(percentage * 100).toStringAsFixed(0)}%",
                            style: const TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF4A00E0),
                          minimumSize: Size(double.infinity, h * 0.07),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 5,
                        ),
                        onPressed: () {
                          cubit.resetQuiz();
                          cubit.fetchQuestions(); // ensure data is fresh
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const QuizScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(l10n.play_again, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, h * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.white.withOpacity(0.5)),
                          ),
                        ),
                        onPressed: () {
                          cubit.resetQuiz();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false,
                          );
                        },
                        child: Text(l10n.back_home, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
