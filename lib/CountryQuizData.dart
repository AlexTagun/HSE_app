class CountryQuizData{
  List<QuestionData> questions;
}

class QuestionData{
  int id;
  String text;
  String info;
  List<AnswerData> answers;

  @override
  String toString() {
    return "id = " + id.toString() + "; text = " + text + "; info = " + info;
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