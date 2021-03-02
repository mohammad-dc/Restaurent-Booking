import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static signToStorage (String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    if(prefs.getString(key) == value){
    return true;
    } else {
      return false;
    }
  }

  static Future<String> getStorageData(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> checkIfExsist(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(key)){
    return true;
    } else {
    return false;
    }
  }
}