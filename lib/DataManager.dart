import 'QuizData.dart';
import 'QuizType.dart';

import 'PlayerSave.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DataManager{
  static DataManager _manager;

  QuizData _countryQuizData;
  QuizData _truthOrLieData;

  PlayerSave _playerSave;

  void setCountryQuizData(QuizData data){
    data.quizType = QuizType.Country;
    _countryQuizData = data;
  }

  void setTruthOrLieQuizData(QuizData data){
    data.quizType = QuizType.TruthOrLie;
    _truthOrLieData = data;
  }

  void setPlayerSave(PlayerSave playerSave){
    _playerSave = playerSave;
  }

  QuizData getCountryQuizData(){
    return _countryQuizData;
  }

  QuizData getTruthOrLieQuizData(){
    return _truthOrLieData;
  }

  PlayerSave getPlayerSave(){
    return _playerSave;
  }

  void clearPlayerSave() async{
    _playerSave = null;

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("player_save");
  }

  static DataManager instance(){
    if(_manager == null){
      _manager = new DataManager();
    }

    return _manager;
  }
}