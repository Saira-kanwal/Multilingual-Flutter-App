import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage with ChangeNotifier {

  Locale? _appLocale ;
  Locale? get appLocale => _appLocale;
  final List<String> languages = ['English', 'Urdu'];
  var selectedLanguage;

  // setLanguage(value){
  //   selectedLanguage = value;
  //   notifyListeners();
  // }

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance() ;
    _appLocale = type;

    if(type == const Locale('en')){
      await sp.setString('language_code', 'en');
    } else {
      await sp.setString('language_code', 'ur');
    }
    notifyListeners();
  }
}



