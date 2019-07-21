import 'package:hse_app/DataManager.dart';
import 'QuizData.dart';

enum QuizType{
  Country,
  TruthOrLie,
}

class QuizManager{
  static const int MAX_QUESTION_COUNT = 10;

  int _correctAnswerCount = 0;
  bool _isAnswerChecked = false;

  QuizData _currentQuizData;




  static QuizManager _manager;
  int currentQuestionId = 0;

  void startQuiz(QuizType type){

    _currentQuizData = _getCurrentQuizData(type);
    currentQuestionId = 0;
    _correctAnswerCount = 0;
    _isAnswerChecked = false;
  }

  QuizData _getCurrentQuizData(QuizType type){
    QuizData data;

    switch(type){
      case QuizType.Country: data = DataManager.instance().getCountryQuizData();
      break;
      case QuizType.TruthOrLie: data = DataManager.instance().getTruthOrLieQuizData();
      break;
      default:  return null;
    }

    return data;
  }

  void changeQuestion() {
    currentQuestionId++;
    _isAnswerChecked = false;
  }

  bool isAnswerCorrect(int id){
    var isCorrect = _currentQuizData.questions[currentQuestionId].answers[id].isCorrect;

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
    var answers = _currentQuizData.questions[currentQuestionId].answers;
    for(int cnt = 0; cnt < answers.length; cnt++){
      if(answers[cnt].isCorrect) return cnt;
    }
    return null;
  }

  String getQuestion(){
    var question = _currentQuizData.questions[currentQuestionId];
    return question.text;
  }

  String getAnswerById(int id){
    var answers = _currentQuizData.questions[currentQuestionId].answers;
    var answersLength = answers.length;

    if(id < answersLength){
      return answers[id].text;
    }else{
      return "NaN";
    }
  }

  String getHint(){
    var question = _currentQuizData.questions[currentQuestionId];
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
