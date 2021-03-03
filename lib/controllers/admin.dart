import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/adminLogin.dart';
import 'package:flutter_application_1/models/admin.dart';
import 'package:flutter_application_1/config/storage.dart';
import 'package:flutter_application_1/models/error.dart';
import 'dart:convert';

// login
Future<dynamic> adminLogin(email, password) async {
  final response = await http.post('$URL_ADMIN/login',
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': email, 'password': password}));
  if (response.statusCode == 200) {
    SharedPreferencesHelper.signToStorage(
        'adminToken', jsonDecode(response.body)['token']);
    return AdminLogin.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 || response.statusCode == 500) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

// fetch admin
Future<dynamic> fetchAdmin() async {
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.get('$URL_ADMIN/get',
      headers: <String, String>{'Authorization': 'Bearer $token'});
  if (response.statusCode == 200) {
    return Admin.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}

// update admin
Future<dynamic> updateAdmin(_id, email, password, name, address, image) async {
  String token = await SharedPreferencesHelper.getStorageData('adminToken');
  final response = await http.put('$URL_ADMIN/update/$_id',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'name': name,
        'address': address,
        'image': image
      }));

  if (response.statusCode == 200) {
    return Admin.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401 ||
      response.statusCode == 400 ||
      response.statusCode == 404) {
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}
