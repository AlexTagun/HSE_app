import 'CountryQuizData.dart';

class DataManager{
  static DataManager _manager;

  CountryQuizData _countryQuizData;

  void setCountryQuizData(CountryQuizData data){
    _countryQuizData = data;
  }

  static DataManager instance(){
    if(_manager == null){
      _manager = new DataManager();
    }

    return _manager;
  }
}