import 'QuizData.dart';

class DataManager{
  static DataManager _manager;

  QuizData _countryQuizData;
  QuizData _truthOrLieData;

  void setCountryQuizData(QuizData data){
    _countryQuizData = data;
  }

  void setTruthOrLieQuizData(QuizData data){
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