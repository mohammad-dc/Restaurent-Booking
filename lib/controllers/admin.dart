import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/admin.dart';
import 'package:flutter_application_1/models/error.dart';
import 'dart:convert';

// login 
Future<dynamic> adminLogin(email, password) async{
  final response = await http.post('$URL_ADMIN/login', headers: <String, String>{
    'Content-Type': 'application/json'
  },
  body: jsonEncode(<String, String>{
    'email': email,
    'password': password
  })); 
  if(response.statusCode == 200){
    signToStorage('adminToken', jsonDecode(response.body)['token']);
    return AdminLogin.fromJson(jsonDecode(response.body));
  } else if(response.statusCode == 401 || response.statusCode == 500){
    return Error.fromJson(jsonDecode(response.body));
  } else {
    return Exception('حدث خطأ في العملية : ${response.toString()}');
  }
}
