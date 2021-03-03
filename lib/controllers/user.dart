import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/config/storage.dart';
import 'package:flutter_application_1/models/error.dart';
import 'dart:convert';

//login
Future<dynamic> userLogin(email, password) async {
  final response = await http.post('$URL_USER/login',
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}));
  if (response.statusCode == 200) {
    SharedPreferencesHelper.signToStorage(
        'userToken', jsonDecode(response.body)['token']);
    SharedPreferencesHelper.signToStorage(
        'userID', jsonDecode(response.body)['user']['_id']);
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//register
Future<dynamic> userRegister(
    email, password, first_name, last_name, mobile) async {
  final response = await http.post('$URL_USER/register',
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
        'mobile': mobile
      }));
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//update
Future<dynamic> userUpdate(
    _id, email, password, first_name, last_name, mobile, image) async {
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  final response = await http.put('$URL_USER/update/$_id',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
        'mobile': mobile,
        'image': image
      }));
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//fetch notifications
Future<dynamic> fetchNotifications(_id) async {
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  final response = await http.get('$URL_USER/get-notificatios/$_id',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

Future<dynamic> fetchUser() async {
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  String _id = await SharedPreferencesHelper.getStorageData('userID');
  final response = await http.get('$URL_USER/get/$_id',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}
