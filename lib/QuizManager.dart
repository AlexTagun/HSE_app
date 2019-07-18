import 'package:hse_app/DataManager.dart';

class QuizManager{
  static const int _MAX_QUESTION_COUNT = 10;


  static QuizManager _manager;
  int _currentQuestionId = 0;

  void startQuiz(){
    _currentQuestionId = 0;
  }

  void changeQuestion() {
    _currentQuestionId++;

    if (_MAX_QUESTION_COUNT < _currentQuestionId) {
      //TODO: show total view
    }
  }

  bool isAnswerCorrect(int id){
    return DataManager.instance().getCountryQuizData().questions[_currentQuestionId].answers[id].isCorrect;
  }

  int getCorrectAnswerId(){
    var answers = DataManager.instance().getCountryQuizData().questions[_currentQuestionId].answers;
    for(int cnt = 0; cnt < answers.length; cnt++){
      if(answers[cnt].isCorrect) return cnt;
    }
    return null;
  }

  String getQuestion(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[_currentQuestionId];
    return question.text;
  }

  String getAnswerById(int id){
    var data = DataManager.instance().getCountryQuizData();
    var answers = data.questions[_currentQuestionId].answers;
    return answers[id].text;
  }

  String getHint(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[_currentQuestionId];
    return question.info;
  }

  static QuizManager instance(){
    if(_manager == null){
      _manager = new QuizManager();
    }

    return _manager;
  }

}
