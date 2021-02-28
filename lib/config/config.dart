import 'package:shared_preferences/shared_preferences.dart';

const SERVER_NAME = "192.168.1.105"; //your server's ip address
const PORT = 5000;
const BASE_URL = "http://$SERVER_NAME:$PORT/api";
const URL_ADMIN = "$BASE_URL/admin";
const URL_USER = '$BASE_URL/user';
const URL_ADMIN_MENU_FOOD = '$URL_ADMIN/menu-food';
const URL_USER_MENU_FOOD = '$URL_USER/menu-food';
const URL_ADMIN_ORDER = "$URL_ADMIN/order";
const URL_USER_ORDER = "$URL_USER/order";

//local storage
signToStorage(String key, dynamic value)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
  if(prefs.getString(key) == value){
  return true;
  } else {
    return false;
  }
}

getStorageData(String key)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString(key));
}
