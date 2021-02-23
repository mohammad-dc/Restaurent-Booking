import 'package:http/http.dart' as http;
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/admin.dart';
import 'dart:convert';

// login 
Future<Admin> adminLogin(email, password) async{
  final response = await http.post('$URL_ADMIN/login', headers: <String, String>{
    'Content-Type': 'application/json'
  },
  body: jsonEncode(<String, String>{
    'email': email,
    'password': password
  })); 
  if(response.statusCode == 200){
    storage.write(key: 'adminToken', value: jsonDecode(response.body)['token']);
    return Admin.fromJson(jsonDecode(response.body));
  } else {
    return jsonDecode(response.body)['message'];
  }
}
