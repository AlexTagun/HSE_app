class CountryQuizData{
  List<QuestionData> questions;
}

class QuestionData{
  int id;
  String text;
  List<AnswerData> answers;

  @override
  String toString() {
    return "id = " + id.toString() + "; text = " + text;
  }

}

class AnswerData{
  int id;
  String text;
  bool isCorrect;

  @override
  String toString() {
    return "id = " + id.toString() + "; text = " + text + "; isCorrect = " + isCorrect.toString();
  }
}