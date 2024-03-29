import 'DataManager.dart';
import 'QuizData.dart';
import 'QuizRandom.dart';
import 'SaveManager.dart';
import 'QuizType.dart';



class QuizManager{
  static const int MAX_QUESTION_COUNT = 10;

  int _correctAnswerCount = 0;
  bool _isAnswerChecked = false;

  QuizData _currentQuizData;
  QuestionData _currentQuestion;

  List<int> _questionIndexes = new List();




  static QuizManager _manager;
  int currentQuestionId = 0;

  void startQuiz(QuizType type, bool useSave){
    _currentQuizData = _getCurrentQuizData(type);

    var questionLength = _currentQuizData.questions.length;

    if(useSave){
      var playerSave = DataManager.instance().getPlayerSave();

      _questionIndexes = playerSave.questionIndexers;
      currentQuestionId = playerSave.currentQuestionId;
      _correctAnswerCount = playerSave.correctAnswerCount;

    }else{
      _questionIndexes = QuizRandom.instance().generateIntList(questionLength, MAX_QUESTION_COUNT,true);
      currentQuestionId = 0;
      _correctAnswerCount = 0;
    }

    _currentQuestion = _currentQuizData.questions[_getCurrentQuestionIndex()];
    _isAnswerChecked = false;

    _trySave();
  }

  int _getCurrentQuestionIndex(){
    if(isQuestionsEnded()){
      var lastIndex = _questionIndexes.length - 1;
      return _questionIndexes[lastIndex];
    }else{
      return _questionIndexes[currentQuestionId];
    }
  }

  bool isQuestionsEnded(){
    return MAX_QUESTION_COUNT <= currentQuestionId;
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
    _currentQuestion = _currentQuizData.questions[_getCurrentQuestionIndex()];

    _isAnswerChecked = false;

    _trySave();
  }

  bool isAnswerCorrect(int id){
    var isCorrect = _currentQuestion.answers[id].isCorrect;

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
    var answers = _currentQuestion.answers;
    for(int cnt = 0; cnt < answers.length; cnt++){
      if(answers[cnt].isCorrect) return cnt;
    }
    return null;
  }

  String getQuestion(){
    var question = _currentQuestion;
    return question.text;
  }

  String getAnswerById(int id){
    var answers = _currentQuestion.answers;
    var answersLength = answers.length;

    if(id < answersLength){
      return answers[id].text;
    }else{
      return "NaN";
    }
  }

  String getHint(){
    return _currentQuestion.info;
  }

  int getCorrectAnswerCount(){
    return _correctAnswerCount;
  }

  void _trySave(){
    if(!isQuestionsEnded()){
      SaveManager.instance().save(_currentQuizData.quizType, _correctAnswerCount, currentQuestionId, _questionIndexes);
    }
  }

  static QuizManager instance(){
    if(_manager == null){
      _manager = new QuizManager();
    }

    return _manager;
  }

}
