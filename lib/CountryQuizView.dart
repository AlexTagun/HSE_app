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
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child:
                  new Text(
                      QuizManager.instance().getQuestion()
                  ),
                flex: 2,
              ),



              Expanded(
                child: Divider(),
                flex: 1,
              ),
//              visibilityTag ? new Text(QuizManager.instance().getHint(),) : new Container(),
              !visibilityTag ? Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                flex: 2,
              ) : new Container(),
              visibilityTag ? Expanded(
                child: new Text(QuizManager.instance().getHint(),),
                flex: 2,
              ) : new Container(),

              Expanded(
                child:  new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Column(
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
                      flex: 1,
                    ),

                    Expanded(
                      child: new Column(

                        children: <Widget>[
                          new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: colorButton2,
                            onPressed: (){showAnswer(2);},
                            child: new Text(
                                QuizManager.instance().getAnswerById(2)
                            ),
                          ),
                          new RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: colorButton3,
                            onPressed: (){showAnswer(3);},
                            child: new Text(
                                QuizManager.instance().getAnswerById(3)
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 3,
              ),


//               new RaisedButton(
              !visibilityTag ? Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                flex: 1,
              ) : new Container(),
              visibilityTag ? Expanded(
                child: new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: toNextQuestionView,
                  child: new Text("Далее"),
                  ),
                flex: 1,
              ) : new Container(),
//              visibilityTag ?
            ]
        ),

      ),
    );
  }
}