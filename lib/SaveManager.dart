import 'PlayerSave.dart';
import 'QuizType.dart';

import 'DataManager.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SaveManager{
  static SaveManager _manager;

  void save(QuizType quizType, int correctAnswerCount, int currentQuestionId, List<int> questionIndexers) async{
    var playerSave = new PlayerSave(quizType: quizType.toString(), correctAnswerCount: correctAnswerCount,
        currentQuestionId: currentQuestionId, questionIndexers: questionIndexers);

    DataManager.instance().setPlayerSave(playerSave);

    var json = playerSave.toJson();
    var jsonString = jsonEncode(json);

    final prefs = await SharedPreferences.getInstance();

    prefs.setString("player_save", jsonString);

    print("jsonSave = " + jsonString);
  }


  static SaveManager instance(){
    if(_manager == null){
      _manager = new SaveManager();
    }

    return _manager;
  }
}