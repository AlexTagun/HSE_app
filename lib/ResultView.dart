import 'package:flutter/material.dart';
import 'package:hse_app/QuizManager.dart';

class ResultView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ResultViewState();
  }
}

class ResultViewState extends State<ResultView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                  "ваш результат" + QuizManager.instance().getCorrectAnswerCount().toString() + "/" + QuizManager.MAX_QUESTION_COUNT.toString(),
              ),

            ]
        ),

      ),
    );
  }
}