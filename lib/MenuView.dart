import 'package:flutter/material.dart';
import 'CountryQuizView.dart';
import 'TruthOrLieQuizView.dart';

import 'package:hse_app/LoadManager.dart';
import 'package:hse_app/QuizManager.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainViewState();
  }
}

class MainViewState extends State<MainView> {


  void toCountryQuizView(){
    if(LoadManager.instance().isAllLoaded()) {
      QuizManager.instance().startQuiz(QuizType.Country);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CountryQuizView()),

      );
    }else{
      print("File is not loaded");
    }
  }

  void toTrueOrLieQuizView(){
    if(LoadManager.instance().isAllLoaded()) {
      QuizManager.instance().startQuiz(QuizType.TruthOrLie);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TruthOrLieQuizView()),

      );
    }else{
      print("File is not loaded");
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Hse App"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Image.asset(
                'assets/res/hse_logo.png',
                fit: BoxFit.contain,
              ),

              new Text("Проектно-учебная лаборатория антикоррупционной политики",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        new RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: toCountryQuizView,
                          child: new Text("Викторина"),
                        ),

                        new RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: toTrueOrLieQuizView,
                          child: new Text("Второй режим"),
                        ),
                      ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}