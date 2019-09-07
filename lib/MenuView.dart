import 'package:flutter/material.dart';
import 'CountryQuizView.dart';
import 'TruthOrLieQuizView.dart';

import 'LoadManager.dart';
import 'QuizManager.dart';
import 'DataManager.dart';
import 'QuizType.dart';
import 'package:url_launcher/url_launcher.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainViewState();
  }
}

class MainViewState extends State<MainView> {
  bool canShowContinueButton = false;

  @override
  void initState() {
    canShowContinueButton = DataManager.instance().getPlayerSave() != null;
    super.initState();
  }


  void clickContinueButton(){
    var quizTypeIndex = DataManager.instance().getPlayerSave().quizType;
    var quizType = QuizType.values[quizTypeIndex];

    changeQuizView(quizType);
  }

  void changeQuizView(QuizType quizType){
    if(LoadManager.instance().isAllLoaded()){
      QuizManager.instance().startQuiz(quizType);

      switch(quizType){
        case QuizType.Country :
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountryQuizView()),

          );
          break;
        case QuizType.TruthOrLie:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TruthOrLieQuizView()),

          );
          break;
        default:
          print("quizType = " + quizType.toString() + " not found");

      }
    }else{
      print("File is not loaded");
    }


  }

  void toCountryQuizView(){
    changeQuizView(QuizType.Country);
  }

  void toTrueOrLieQuizView(){
    changeQuizView(QuizType.TruthOrLie);
  }

  _launchURL() async {
    const url = 'https://lap.hse.ru/about';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Center(
          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Image.asset(
                  'assets/res/hse_plus_lab_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
//              ),
              new Text("Антикоррупционная обучающая игра",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                textAlign: TextAlign.center,
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Visibility(
                          visible: canShowContinueButton,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: clickContinueButton,
                            child: new Text("Продолжить"),
                          ),
                        ),
                          new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: toCountryQuizView,
                            child: new Text("Угадай страну"),
                          ),

                          new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: toTrueOrLieQuizView,
                            child: new Text("Верю - не верю"),
                          ),
                          new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: _launchURL,
                            child: new Text("О нас"),
                          ),
                        ],
                    ),
                  ],
                ),
            ],
          ),
        )
    );
  }
}