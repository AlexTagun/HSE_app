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
        title: Text("Hse App"),
      ),
      body: Center(
        child: new Column(
            children: <Widget>[


              !visibilityTag ? Expanded(
                child:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(
                    QuizManager.instance().getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                flex: 5,
              ) : new Container(),
              visibilityTag ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(
                    QuizManager.instance().getHint(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                flex: 5,
              ) : new Container(),

              Expanded(
                child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
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
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        !visibilityTag ?  Container(
                          decoration: const BoxDecoration(),
                        ) : Container(),

                        visibilityTag ?  new RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: toNextQuestionView,
                          child: new Text("Далее"),
                        ) : Container(),
                      ],
                    ),
                  ]
                ),
                flex: 1,
              ),

//              !visibilityTag ? Expanded(
//                child: Container(
//                  decoration: const BoxDecoration(color: Colors.white),
//                ),
//                flex: 1,
//              ): new Container(),
//
//              visibilityTag ? Expanded(
//                child: new RaisedButton(
//                  padding: const EdgeInsets.all(8.0),
//                  textColor: Colors.white,
//                  color: Colors.blue,
//                  onPressed: toNextQuestionView,
//                  child: new Text("Далее"),
//                ),
//                flex: 1,
//              ) : new Container(),
            ]
        ),

      ),
    );
  }
}