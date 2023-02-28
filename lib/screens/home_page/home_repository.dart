

import 'package:shared_preferences/shared_preferences.dart';


class HomeRepository {
  HomeRepository(this.sharedPreferences);
    SharedPreferences sharedPreferences;
    String namePrefKey = 'name_pref';
    String passwordPrefKey = 'password_pref';
    String removePrefKey = 'remove_pref';
   String resultPreferencesName = ''; // значение взятое с базы
   String resultPreferencesPassword = '';
   String meaning = '';

   Future<void> setNamePref(String value) async {
    await sharedPreferences.setString(namePrefKey, value);// метод записывает в базу
    getNamePref(value);
   }

  Future<void> setPasswordPref(String value) async {
    await sharedPreferences.setString(passwordPrefKey, value);
    getPasswordPref(value);
  }

  void  getNamePref(value) {
    resultPreferencesName = sharedPreferences.getString(namePrefKey) ?? 'в базе нет таких данных';// считывает данные с базы
  }

  void  getPasswordPref(value) {
    resultPreferencesPassword = sharedPreferences.getString(passwordPrefKey) ?? 'нет данных';// считывает данные с базы
  }

  void deletePreferences(value) {
    sharedPreferences.remove(removePrefKey);
  }


  }
