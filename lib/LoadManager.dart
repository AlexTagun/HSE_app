import 'package:flutter/services.dart' show rootBundle;
import 'Parser.dart';
import 'DataManager.dart';

class LoadManager{
  static const String COUNTRY_QUIZ_PATH = "assets/res/CountryQuiz.xml";

  bool _isAllLoaded = false;

  bool _isCountryQuizLoaded = false;

  static LoadManager _manager;

  void load(){
    _loadCountryQuiz();
  }

  static LoadManager instance(){
    if(_manager == null){
      _manager = new LoadManager();
    }

    return _manager;
  }

  bool isAllLoaded(){
    return _isAllLoaded;
  }

  Future<String> _loadCountryQuiz() async{
    var countryQuizString = await rootBundle.loadString(COUNTRY_QUIZ_PATH);

    var countryQuizData = Parser.parseCountryQuizData(countryQuizString);
    DataManager.instance().setCountryQuizData(countryQuizData);
    print("country quiz data is loaded");
    _isCountryQuizLoaded = true;
    _checkAllLoaded();

    return countryQuizString;
  }

  void _checkAllLoaded(){
    if(_isCountryQuizLoaded){
      _isAllLoaded = true;
    }
  }
}