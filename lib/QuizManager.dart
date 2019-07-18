import 'package:hse_app/DataManager.dart';

class QuizManager{
  static const int MAX_QUESTION_COUNT = 10;

  int _correctAnswerCount = 0;
  bool _isAnswerChecked = false;




  static QuizManager _manager;
  int currentQuestionId = 0;

  void startQuiz(){
    currentQuestionId = 0;
    _correctAnswerCount = 0;
    _isAnswerChecked = false;
  }

  void changeQuestion() {
    currentQuestionId++;
    _isAnswerChecked = false;
  }

  bool isAnswerCorrect(int id){
    var isCorrect = DataManager.instance().getCountryQuizData().questions[currentQuestionId].answers[id].isCorrect;

    return isCorrect;
  }

  bool checkAnswerCorrect(int id){
    var isCorrect = isAnswerCorrect(id);
    if(!_isAnswerChecked){
      if(isCorrect){
        _correctAnswerCount++;
      }

      _isAnswerChecked = true;
    }

    return isCorrect;
  }


  int getCorrectAnswerId(){
    var answers = DataManager.instance().getCountryQuizData().questions[currentQuestionId].answers;
    for(int cnt = 0; cnt < answers.length; cnt++){
      if(answers[cnt].isCorrect) return cnt;
    }
    return null;
  }

  String getQuestion(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[currentQuestionId];
    return question.text;
  }

  String getAnswerById(int id){
    var data = DataManager.instance().getCountryQuizData();
    var answers = data.questions[currentQuestionId].answers;
    return answers[id].text;
  }

  String getHint(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[currentQuestionId];
    return question.info;
  }

  int getCorrectAnswerCount(){
    return _correctAnswerCount;
  }

  static QuizManager instance(){
    if(_manager == null){
      _manager = new QuizManager();
    }

    return _manager;
  }

}
