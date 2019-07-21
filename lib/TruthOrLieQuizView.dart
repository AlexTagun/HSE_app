import 'package:flutter/material.dart';
import 'package:hse_app/QuizManager.dart';
import 'ResultView.dart';


class TruthOrLieQuizView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new TruthOrLieQuizViewState();
  }
}

class TruthOrLieQuizViewState extends State<TruthOrLieQuizView> {

  bool isAnswerGiven = false;
  bool visibilityTag = false;
  Color colorButton0 = Colors.blue;
  Color colorButton1 = Colors.blue;

  void toMainView() {
    Navigator.pop(context);
  }


  void toNextQuestionView(){
    QuizManager.instance().changeQuestion();

    if (QuizManager.MAX_QUESTION_COUNT <= QuizManager.instance().currentQuestionId) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultView()),
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TruthOrLieQuizView()),
      );
    }

  }

  void setColorButton(int buttonNum, Color color){
    switch(buttonNum){
      case 0: colorButton0 = color;
      break;
      case 1: colorButton1 = color;
      break;
      default:  return;
    }
  }

  void showAnswer(int buttonNum){
    if(isAnswerGiven) return;
    isAnswerGiven = true;
    setState(() {
      if(QuizManager.instance().checkAnswerCorrect(buttonNum)){
        setColorButton(buttonNum, Colors.green);
      }else{
        setColorButton(buttonNum, Colors.red);
        setColorButton(QuizManager.instance().getCorrectAnswerId(), Colors.green);
      }
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
                color: colorButton0,
                onPressed: (){showAnswer(0);},
                child: new Text(
                    QuizManager.instance().getAnswerById(0)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: colorButton1,
                onPressed: (){showAnswer(1);},
                child: new Text(
                    QuizManager.instance().getAnswerById(1)
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