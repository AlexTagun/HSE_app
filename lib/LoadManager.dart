import 'package:flutter/services.dart' show rootBundle;
import 'Parser.dart';
import 'DataManager.dart';

class LoadManager{
  static const String COUNTRY_QUIZ_PATH = "assets/res/CountryQuiz.xml";
  static const String TRUTH_OR_LIE_QUIZ_PATH = "assets/res/TruthOrLieQuiz.xml";

  bool _isAllLoaded = false;

  bool _isCountryQuizLoaded = false;
  bool _isTruthOrLieQuizLoaded = false;

  static LoadManager _manager;

  void load(){
    _loadCountryQuiz();
    _loadTruthOrLieQuiz();
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

    var countryQuizData = Parser.parseQuizData(countryQuizString);
    DataManager.instance().setCountryQuizData(countryQuizData);
    print("country quiz data is loaded");
    _isCountryQuizLoaded = true;
    _checkAllLoaded();

    return countryQuizString;
  }

  Future<String> _loadTruthOrLieQuiz() async{
    var truthOrLieQuizString = await rootBundle.loadString(TRUTH_OR_LIE_QUIZ_PATH);

    var truthOrLieQuizData = Parser.parseQuizData(truthOrLieQuizString);
    DataManager.instance().setTruthOrLieQuizData(truthOrLieQuizData);
    print("truth or lie quiz data is loaded");
    _isTruthOrLieQuizLoaded = true;
    _checkAllLoaded();
  }

  void _checkAllLoaded(){
    if(_isCountryQuizLoaded && _isTruthOrLieQuizLoaded){
      _isAllLoaded = true;
    }
  }
}