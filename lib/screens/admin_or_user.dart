import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'admin/login.dart';
import 'user/signup.dart';
import 'package:flutter_application_1/widgets/account_btn.dart';

class AdminOrUser extends StatefulWidget {
  @override
  _AdminOrUserState createState() => _AdminOrUserState();
}

class _AdminOrUserState extends State<AdminOrUser> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: grayColormin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'حجوزات',
              style: TextStyle(
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  color: blackColor),
            ),
            SizedBox(height: 15.0),
            Text(
              'قم باختيار نوع الحساب الخاص بك...',
              style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  color: grayColormax),
            ),
            SizedBox(height: 20.0),
            AccountBtn(text: 'مسؤول', navigatorPage: Login()),
            SizedBox(height: 30.0),
            AccountBtn(text: 'مستخدم', navigatorPage: SignUp()),
          ],
        ),
      ),
    );
  }
}
