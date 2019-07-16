import 'CountryQuizData.dart';
import 'package:xml/xml.dart' as xml;


class Parser{

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

      if(currentAttribute.name.toString() == "info"){
        data.info = currentAttribute.value;
      }
    }

    print(data.toString());

    var answerElementList = questionElement.findElements('answer');

    List <AnswerData> answerList = new List();
    for (int i = 0; i < answerElementList.length; i++){
      var answer = parseAnswerData(answerElementList.elementAt(i));
      answerList.add(answer);
    }

    data.answers = answerList;
    
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

