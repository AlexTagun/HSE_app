import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'Parser.dart';
import 'DataManager.dart';
import 'package:hse_lab_app/PlayerSave.dart';

class LoadManager{
  static const String COUNTRY_QUIZ_PATH = "assets/res/CountryQuiz.xml";
  static const String TRUTH_OR_LIE_QUIZ_PATH = "assets/res/TruthOrLieQuiz.xml";

  bool _isAllLoaded = false;

  bool _isPlayerSaveLoaded = false;
  bool _isCountryQuizLoaded = false;
  bool _isTruthOrLieQuizLoaded = false;

  static LoadManager _manager;

  void load(){
    _loadPlayerSave();
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

  void _loadPlayerSave() async{
    final prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey("player_save")){
      var jsonString = prefs.getString("player_save");
      var json = jsonDecode(jsonString);
      PlayerSave playerSave = PlayerSave.fromJson(json);

      DataManager.instance().setPlayerSave(playerSave);

      print("jsonLoad = " + jsonString);
    }

    _isPlayerSaveLoaded = true;
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
    if(_isPlayerSaveLoaded && _isCountryQuizLoaded && _isTruthOrLieQuizLoaded){
      _isAllLoaded = true;
    }
  }
}