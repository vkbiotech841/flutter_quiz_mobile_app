// Here, we are creating a data model for the QuizQuestion.
// Here, we have a constructor function, which accepts variables (text) and lists (answers).

class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSuffledAnswers() {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}
