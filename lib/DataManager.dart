import 'QuizData.dart';
import 'QuizType.dart';

class DataManager{
  static DataManager _manager;

  QuizData _countryQuizData;
  QuizData _truthOrLieData;

  void setCountryQuizData(QuizData data){
    data.quizType = QuizType.Country;
    _countryQuizData = data;
  }

  void setTruthOrLieQuizData(QuizData data){
    data.quizType = QuizType.TruthOrLie;
    _truthOrLieData = data;
  }

  QuizData getCountryQuizData(){
    return _countryQuizData;
  }

  QuizData getTruthOrLieQuizData(){
    return _truthOrLieData;
  }

  static DataManager instance(){
    if(_manager == null){
      _manager = new DataManager();
    }

    return _manager;
  }
}