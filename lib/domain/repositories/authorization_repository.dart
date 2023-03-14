

import 'package:shared_preferences/shared_preferences.dart';


class AuthorizationRepository {
  AuthorizationRepository(this.sharedPreferences);
    SharedPreferences sharedPreferences;
    String namePrefKey = 'name_pref';
    String passwordPrefKey = 'password_pref';
    String removePrefKey = 'remove_pref';


   Future<void> setNamePref(String value) async {
    await sharedPreferences.setString(namePrefKey, value);// метод записывает в базу
    getNamePref();
   }

  Future<void> setPasswordPref(String value) async {
    await sharedPreferences.setString(passwordPrefKey, value);
    getPasswordPref();
  }

  String? getNamePref() {
    return sharedPreferences.getString(namePrefKey);// считывает данные с базы

  }

  String? getPasswordPref() {
     return sharedPreferences.getString(passwordPrefKey);// считывает данные с базы
  }

  void deletePreferences(value) {
    sharedPreferences.remove(removePrefKey);
  }


  }
