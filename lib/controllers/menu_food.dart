import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/config/storage.dart';
import 'package:flutter_application_1/models/menu_food.dart';
import 'package:flutter_application_1/models/error.dart';
import 'dart:convert';

//fetch menu food
Future<dynamic> fethcMenuFood(isAdmin) async{
  String token = isAdmin? 
    await SharedPreferencesHelper.getStorageData('adminToken')
    : await SharedPreferencesHelper.getStorageData('userToken');
  final response = await http.get(isAdmin?
    '$URL_ADMIN_MENU_FOOD/get'
    : '$URL_USER_MENU_FOOD/get', headers: <String, String>{
    'Authorization': 'Bearer $token'
  });
  if(response.statusCode == 200){
    return MenuFood.fromJson(jsonDecode(response.body));
  }
  else if (response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

// add menu food
Future<dynamic> addMenuFood(name, price, image) async{
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.post('$URL_ADMIN_MENU_FOOD/add', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  },
  body: jsonEncode(<String, String>{
    'name': name,
    'price': price,
    'image': image
  })); 
  if(response.statusCode == 201){
    return MenuFood.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

// update menu food
Future<dynamic> updateMenuFood(_id, name, price, image) async{
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.put('$URL_ADMIN_MENU_FOOD/update/$_id', headers: <String, String>{
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  },
  body: jsonEncode(<String, String>{
    'name': name,
    'price': price,
    'image': image
  })); 
  if(response.statusCode == 200){
    return MenuFood.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 500){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

// delete menu food
Future<dynamic> deleteMenuFood(_id) async{
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.delete('$URL_ADMIN_MENU_FOOD/delete/$_id', headers: <String, String>{
    'Authorization': 'Bearer $token'
  }); 
  if(response.statusCode == 200){
    return MenuFood.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 400 || response.statusCode == 404){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}