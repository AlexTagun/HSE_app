import 'package:flutter/material.dart';
import 'QuizView.dart';
import 'package:hse_app/LoadManager.dart';
import 'package:hse_app/QuizManager.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainViewState();
  }
}

class MainViewState extends State<MainView> {


  void toQuizView() {
    if(LoadManager.instance().isAllLoaded()) {
      QuizManager.instance().startQuiz();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuizView()),

      );
    }else{
      print("File is not loaded");
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Raised Button"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: toQuizView,
                    child: new Text("Викторина"),
                  ),

                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: toQuizView,
                    child: new Text("Второй режим"),
                  ),

                ],
              )
            ],
          ),
        ));
  }
}