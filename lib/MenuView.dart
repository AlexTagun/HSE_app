import 'package:flutter/material.dart';
import 'CountryQuizView.dart';
import 'TruthOrLieQuizView.dart';

import 'package:hse_app/LoadManager.dart';
import 'package:hse_app/QuizManager.dart';
import 'package:url_launcher/url_launcher.dart';

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
        appBar: new AppBar(
          title: new Text("Hse App"),
        ),
        body: new Center(
          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              new Image.asset(
                'assets/res/hse_logo.png',
                fit: BoxFit.contain,
              ),
              new Image.asset(
                'assets/res/lab_logo.png',
//                fit: BoxFit.contain,
              ),


//              new Text("Проектно-учебная лаборатория антикоррупционной политики",
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                textAlign: TextAlign.center,
//              ),

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