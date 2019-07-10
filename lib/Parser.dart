import 'CountryQuizData.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;

class Parser{
  static const String COUNTRY_QUIZ_PATH = "assets/res/CountryQuiz.xml";

  //TODO: shift to loadFile class
  static Future<String> getCountryQuizString() async{
    var countryQuizString = await rootBundle.loadString(COUNTRY_QUIZ_PATH);

    var countryQuizData = parseCountryQuizData(countryQuizString);
    return countryQuizString;
  }

  static CountryQuizData parseCountryQuizData(String countryQuizString){
    var countryQuizXml = xml.parse(countryQuizString);
    print(countryQuizXml.toString());

    var countryQuizElement = countryQuizXml.rootElement;

    var questionElementList = countryQuizElement.findElements('question');
    int questionElementCount = questionElementList.length;

    List<QuestionData> questionList = new List();
    for(int i = 0; i < questionElementCount; i++){
      var question = parseQuestionData(questionElementList.elementAt(i));
      questionList.add(question);
    }

    CountryQuizData data = new CountryQuizData();
    data.questions = questionList;

    return data;
  }

  static QuestionData parseQuestionData(xml.XmlElement questionElement){
    var data = new QuestionData();

    var attributeList = questionElement.attributes;
    for (int i = 0; i < attributeList.length; i++){
      var currentAttribute = attributeList.elementAt(i);

      if(currentAttribute.name.toString() == "id"){
        data.id = int.parse(currentAttribute.value);
      }

      if(currentAttribute.name.toString() == "text"){
        data.text = currentAttribute.value;
      }
    }

    var answerElementList = questionElement.findElements('answer');

    List <AnswerData> answerList = new List();
    for (int i = 0; i < answerElementList.length; i++){
      var answer = parseAnswerData(answerElementList.elementAt(i));
      answerList.add(answer);
    }

    data.answers = answerList;
    
    print(data.toString());

    return data;
  }

  static AnswerData parseAnswerData(xml.XmlElement answerElement){
    var data = new AnswerData();

    var attributeList = answerElement.attributes;
    for(int i = 0; i < attributeList.length; i++){
      var currentAttribute = attributeList.elementAt(i);

      if(currentAttribute.name.toString() == "id"){
        data.id = int.parse(currentAttribute.value);
      }

      if(currentAttribute.name.toString() == "text"){
        data.text = currentAttribute.value;
      }

      if(currentAttribute.name.toString() == "correct"){
        data.isCorrect = currentAttribute.value.toLowerCase() == 'true';
      }
    }
    print(data.toString());

    return data;
  }
}

