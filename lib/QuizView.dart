import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizViewState();
  }
}

class QuizViewState extends State<QuizView> {

  bool visibilityTag = false;

  void toMainVew() {
    Navigator.pop(context);
  }

  void showAnswer(int buttonNum){
    setState(() {
      buttonNum++;
      visibilityTag = true;
    });
  }

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
                  "Вопрос"
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(1);},
                child: new Text(
                    "Ответ 1"
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(2);},
                child: new Text("Ответ 2"),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(3);},
                child: new Text("Ответ 3"),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(4);},
                child: new Text("Ответ 4"),
              ),
              visibilityTag ? new Text("Тупо подсказка",) : new Container(),


              visibilityTag ? new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: toMainVew,
                child: new Text("Далее"),
              ) : new Container(),
            ]
        ),

      ),
    );
  }
}