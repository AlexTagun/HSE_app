import 'package:flutter/material.dart';
import 'QuizView.dart';

class TextButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextButtonState();
  }
}

class TextButtonState extends State<TextButton> {


  void toQuizVew() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizView()),
    );
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
                    onPressed: toQuizVew,
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
                    onPressed: toQuizVew,
                    child: new Text("Второй режим"),
                  ),

                ],
              )
            ],
          ),
        ));
  }
}