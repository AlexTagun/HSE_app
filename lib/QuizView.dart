import 'package:flutter/material.dart';
import 'package:hse_app/QuizManager.dart';

class QuizView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new QuizViewState();
  }
}

class QuizViewState extends State<QuizView> {

  bool visibilityTag = false;

  void toMainView() {
    Navigator.pop(context);
  }


  void toNextQuestionView(){
    QuizManager.instance().changeQuestion();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizView()),

    );
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
                  QuizManager.instance().getQuestion()
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(0);},
                child: new Text(
                    QuizManager.instance().getAnswerById(0)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(1);},
                child: new Text(
                    QuizManager.instance().getAnswerById(1)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(2);},
                child: new Text(
                    QuizManager.instance().getAnswerById(2)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(3);},
                child: new Text(
                    QuizManager.instance().getAnswerById(3)
                ),
              ),
              visibilityTag ? new Text(QuizManager.instance().getHint(),) : new Container(),


              visibilityTag ? new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: toNextQuestionView,
                child: new Text("Далее"),
              ) : new Container(),
            ]
        ),

      ),
    );
  }
}