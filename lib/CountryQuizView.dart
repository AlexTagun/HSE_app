import 'package:flutter/material.dart';
import 'package:hse_app/QuizManager.dart';
import 'ResultView.dart';


class CountryQuizView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new CountryQuizViewState();
  }
}

class CountryQuizViewState extends State<CountryQuizView> {

  bool isAnswerGiven = false;
  bool visibilityTag = false;
  Color colorButton0 = Colors.blue;
  Color colorButton1 = Colors.blue;
  Color colorButton2 = Colors.blue;
  Color colorButton3 = Colors.blue;

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
        MaterialPageRoute(builder: (context) => CountryQuizView()),
      );
    }

  }

  void setColorButton(int buttonNum, Color color){
    switch(buttonNum){
      case 0: colorButton0 = color;
      break;
      case 1: colorButton1 = color;
      break;
      case 2: colorButton2 = color;
      break;
      case 3: colorButton3 = color;
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
                flex: 3,
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
                flex: 3,
              ) : new Container(),



              Expanded(
                child:  new Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 35,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: colorButton0,
                        onPressed: (){showAnswer(0);},
                        child: new Text(
                            QuizManager.instance().getAnswerById(0)
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 35,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: colorButton1,
                        onPressed: (){showAnswer(1);},
                        child: new Text(
                            QuizManager.instance().getAnswerById(1)
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 35,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: colorButton2,
                        onPressed: (){showAnswer(2);},
                        child: new Text(
                            QuizManager.instance().getAnswerById(2)
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 35,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        textColor: Colors.white,
                        color: colorButton3,
                        onPressed: (){showAnswer(3);},
                        child: new Text(
                            QuizManager.instance().getAnswerById(3)
                        ),
                      ),
                    ),
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

                flex: 2,
              ),




            ]
        ),

      ),
    );
  }
}