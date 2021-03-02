import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/config/storage.dart';
import 'package:flutter_application_1/models/error.dart';
import 'dart:convert';

//add order
Future<dynamic> addOrder(menu_food_id, total_price, quantity, in_or_not) async{
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  String user_id = await SharedPreferencesHelper.getStorageData('userID');
  final response = await http.post('$URL_USER_ORDER/add', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  },
  body: jsonEncode(<String, dynamic>{
    'menu_food_id': menu_food_id,
    'user_id': user_id,
    'total_price': total_price,
    'quantity': quantity,
    'in_or_not': in_or_not
  })); 
  if(response.statusCode == 201){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    print('ss');
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//edit order
Future<dynamic> updateOrder(_id, menu_food_id, total_price, quantity, in_or_not) async{
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  String user_id = await SharedPreferencesHelper.getStorageData('userID');
  final response = await http.put('$URL_USER_ORDER/update/$_id', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  },
  body: jsonEncode(<String, String>{
    'menu_food_id': menu_food_id,
    'user_id': user_id,
    'total_price': total_price,
    'quantity': quantity,
    'in_or_not': in_or_not
  })); 
  if(response.statusCode == 200){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//cancel order
Future<dynamic> cancelOrder(_id, is_canceled) async{
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  final response = await http.put('$URL_USER_ORDER/cancel/$_id', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  }, 
  body: jsonEncode(<String, bool>{
    'is_canceled': is_canceled
  })); 
  if(response.statusCode == 200){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//get all orders
Future<dynamic> fetchAllOrders() async{
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.put('$URL_USER_ORDER/get', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  }); 
  if(response.statusCode == 200){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//set tiem to order
Future<dynamic> setTimeOrders(_id) async{
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.put('$URL_USER_ORDER/set-time-notif/$_id', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  }); 
  if(response.statusCode == 200){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

//get user orders
Future<dynamic> fetchUserOrders() async{
  String token = await SharedPreferencesHelper.getStorageData('userToken');
  String user_id = await SharedPreferencesHelper.getStorageData('userID');
  final response = await http.get('$URL_USER_ORDER/get/$user_id', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  }); 
  if(response.statusCode == 200){
    return Order.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}