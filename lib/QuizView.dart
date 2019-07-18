import 'package:flutter/material.dart';
import 'package:hse_app/DataManager.dart';
class QuizView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new QuizViewState();
  }
}

class QuizViewState extends State<QuizView> {

  int questionNum = 0;
  String text;
  bool visibilityTag = false;

  String getQuestion(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[questionNum];
    return question.text;
  }

  String getAnswerById(int id){
    var data = DataManager.instance().getCountryQuizData();
    var answers = data.questions[questionNum].answers;
    return answers[id].text;
  }

  String getHint(){
    var data = DataManager.instance().getCountryQuizData();
    var question = data.questions[questionNum];
    return question.info;
  }

  void toMainView() {
    Navigator.pop(context);
  }

  void toNextQuestionView(){

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
                  getQuestion()
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(0);},
                child: new Text(
                    getAnswerById(0)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(1);},
                child: new Text(
                    getAnswerById(1)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(2);},
                child: new Text(
                    getAnswerById(2)
                ),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){showAnswer(3);},
                child: new Text(
                    getAnswerById(3)
                ),
              ),
              visibilityTag ? new Text(getHint(),) : new Container(),


              visibilityTag ? new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: toMainView,
                child: new Text("Далее"),
              ) : new Container(),
            ]
        ),

      ),
    );
  }
}