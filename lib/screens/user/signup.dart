import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(shrinkWrap: false, children: [
          Container(
            color: grayColormin,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'حجوزات',
                  style: TextStyle(
                      color: blackColor,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'أهلا بك سيدي...',
                  style: TextStyle(
                      color: grayColormax,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(fontFamily: 'Cairo'),
                        keyboardType: TextInputType.text,
                        validator: (first_name) {
                          if (first_name.isEmpty) {
                            return 'يجب ملئ هذا الحقل';
                          }
                        },
                        obscureText: false,
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(),
                            labelText: 'الاسم الأول'),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: 'Cairo'),
                        keyboardType: TextInputType.text,
                        validator: (last_name) {
                          if (last_name.isEmpty) {
                            return 'يجب ملئ هذا الحقل';
                          }
                        },
                        obscureText: false,
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(),
                            labelText: 'الاسم الأخير'),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: 'Cairo'),
                        keyboardType: TextInputType.phone,
                        validator: (phone) {
                          if (phone.isEmpty) {
                            return 'يجب ملئ هذا الحقل';
                          }
                        },
                        obscureText: false,
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: 'رقم الهاتف الخلوي'),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: 'Cairo'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email.isEmpty) {
                            return 'يجب ملئ هذا الحقل';
                          } else if (!EmailValidator.validate(email)) {
                            return 'يجب ادخال الايميل بشكل صحيح';
                          }
                        },
                        obscureText: false,
                        autofocus: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            labelText: 'الايميل'),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: TextStyle(fontFamily: 'Cairo'),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (password) {
                          if (password.isEmpty) {
                            return 'يجب ملئ هذا الحقل';
                          } else if (password.length < 8) {
                            return 'يجب ادحال 8 خانات على الأقل';
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          labelText: 'كلمة السر',
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      RaisedButton(
                        color: gradientColor1,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.of(context).pushNamed('/user/login');
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 10.0),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
