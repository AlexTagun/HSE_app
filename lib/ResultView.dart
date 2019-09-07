import 'package:flutter/material.dart';
import 'QuizManager.dart';
import 'MenuView.dart';

import 'DataManager.dart';

class ResultView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ResultViewState();
  }
}

class ResultViewState extends State<ResultView> {

  @override
  void initState() {
    DataManager.instance().clearPlayerSave();
    super.initState();
  }

  void toMenuView(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainView()),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "ваш результат: " + QuizManager.instance().getCorrectAnswerCount().toString() + "/" + QuizManager.MAX_QUESTION_COUNT.toString(),
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: toMenuView,
                  child: new Text("Главная"),
              ),
            ]
        ),

      ),
    );
  }
}