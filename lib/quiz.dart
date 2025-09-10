import 'package:flutter/material.dart';
import 'package:flutter_quize_app/data/questions.dart';
import 'package:flutter_quize_app/questions_screen.dart';
import 'package:flutter_quize_app/result_screen.dart';
import 'package:flutter_quize_app/start_screen.dart';

// Widget class
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// Method01: Using initState

// // state class
// class _QuizState extends State<Quiz> {

//   // Here widget is a special type of variable like var, const and final. Question mark assigns a null value.
//   Widget? activeScreen;

//   // State classes has a initialization function. this function will be first to be executed when a state class creates an object. Hence, all initialization work need to be done here.

//   @override
//   void initState() {
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 78, 13, 151),
//                 Color.fromARGB(255, 107, 15, 168),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }

// Method02: Using Ternary operator

// state class
// class _QuizState extends State<Quiz> {
//   var activeScreen = 'start-screen';

//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions-screen';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 78, 13, 151),
//                 Color.fromARGB(255, 107, 15, 168),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: activeScreen == 'start-screen'
//               ? StartScreen(switchScreen)
//               : const QuestionsScreen(),
//         ),
//       ),
//     );
//   }
// }

// // Method03: Using Ternary operator

// // state class
// class _QuizState extends State<Quiz> {
//   var activeScreen = 'start-screen';

//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions-screen';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidget = activeScreen == 'start-screen'
//         ? StartScreen(switchScreen)
//         : const QuestionsScreen();

//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 78, 13, 151),
//                 Color.fromARGB(255, 107, 15, 168),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: screenWidget,
//         ),
//       ),
//     );
//   }
// }

// Method04: Using if statement

// state class
class _QuizState extends State<Quiz> {
  List<String> selectedAnwsers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnwsers.add(answer);

    if (selectedAnwsers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      selectedAnwsers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chooseAnswers: selectedAnwsers,
        onRestart: onRestartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
