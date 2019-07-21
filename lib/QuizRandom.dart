import 'dart:math';
import 'dart:core';

class QuizRandom{
  static QuizRandom _quizRandom;

  Random _generalRandom;

  QuizRandom(){
    var currentMillisecond = DateTime.now().millisecond;

    _generalRandom = new Random(currentMillisecond);
  }

  List<int> generateIntList(int maxValue, lengthTotalList, bool isPrintList){
    if(maxValue < lengthTotalList){
      throw new Exception("maxValue is smaller than lengthTotalList");
    }

    List<int> generationList = new List();
    for (int i = 0; i < maxValue; i++){
      generationList.add(i);
    }

    List<int> totalList = new List();
    for(int i = 0; i < lengthTotalList; i++){
      var generationListLength = generationList.length;
      var randIndex = _generalRandom.nextInt(generationListLength);

      totalList.add(generationList[randIndex]);
      generationList.removeAt(randIndex);
    }

    if(isPrintList){
      print("totalList");
      for(int i = 0; i < totalList.length; i++){
        print("index = " + i.toString() + "; value = " + totalList[i].toString());
      }
    }

    return totalList;
  }



  static QuizRandom instance(){
    if(_quizRandom == null){
      _quizRandom = new QuizRandom();
    }

    return _quizRandom;
  }
}