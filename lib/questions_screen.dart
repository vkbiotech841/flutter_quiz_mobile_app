import 'package:flutter/material.dart';
import 'package:flutter_quize_app/answer_button.dart';
import 'package:flutter_quize_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget class
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

// State class
class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnwser) {
    widget.onSelectedAnswer(selectedAnwser);
    setState(() {
      currentQuestionIndex++; // increase the value by 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // use as much of width as required
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ...currentQuestion.getSuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
