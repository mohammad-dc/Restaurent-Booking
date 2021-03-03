import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/controllers/user.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller;
  TextEditingController password_controller;
  bool isLoading = false;
  Future<dynamic> _futureUser;

  @override
  void initState() {
    super.initState();
    email_controller = new TextEditingController(text: '');
    password_controller = new TextEditingController(text: '');
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
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
                      controller: email_controller,
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
                      controller: password_controller,
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
                          isLoading = true;
                          setState(() {
                            _futureUser = userLogin(email_controller.text,
                                password_controller.text);
                            isLoading = false;
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 10.0),
                        child: isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(whiteColor),
                              )
                            : Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: whiteColor,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                ),
                              ),
                      ),
                    ),
                    FutureBuilder<dynamic>(
                        future: _futureUser,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.success) {
                              isLoading = true;
                              Future.delayed(Duration.zero, () {
                                Navigator.of(context)
                                    .pushNamed('/user/dashboard');
                              });
                              showToast(snapshot.data.message, greenColor);
                              isLoading = false;
                            } else {
                              showToast(snapshot.data.message, redColor);
                            }
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                          }
                          return Container(
                            height: 0,
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
