import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/controllers/user.dart';
import 'package:flutter_application_1/widgets/toast.dart';

class UserDataUpdateDialog extends StatefulWidget {
  final Map<String, dynamic> initData;
  UserDataUpdateDialog({@required this.initData});
  @override
  _UserDataUpdateDialogState createState() => _UserDataUpdateDialogState();
}

class _UserDataUpdateDialogState extends State<UserDataUpdateDialog> {
  final _formKey = GlobalKey<FormState>();
  Future<dynamic> _futureUser;
  bool isLoading = false;
  TextEditingController email_controller;
  TextEditingController password_controller;
  TextEditingController fname_controller;
  TextEditingController lname_controller;
  TextEditingController mobile_controller;
  TextEditingController image_controller;

  @override
  void initState() {
    super.initState();
    email_controller =
        new TextEditingController(text: widget.initData['email']);
    password_controller =
        new TextEditingController(text: widget.initData['password']);
    fname_controller =
        new TextEditingController(text: widget.initData['first_name']);
    lname_controller =
        new TextEditingController(text: widget.initData['last_name']);
    mobile_controller =
        new TextEditingController(text: widget.initData['mobile']);
    image_controller =
        new TextEditingController(text: widget.initData['image']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            showToast(snapshot.data.message, greenColor);
          } else {
            showToast(snapshot.data.message, redColor);
          }
        } else if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: gradientColor1,
              title: Text(
                'تعديل المعلومات',
                style: TextStyle(
                    color: whiteColor,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        isLoading = true;
                        setState(() {
                          _futureUser = userUpdate(
                              widget.initData['_id'],
                              email_controller.text,
                              password_controller.text,
                              fname_controller.text,
                              lname_controller.text,
                              mobile_controller.text,
                              image_controller.text);
                          isLoading = false;
                        });
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(whiteColor),
                          )
                        : Text(
                            'حفظ',
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'Cairo',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Center(
                child: ListView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email_controller,
                            style: TextStyle(fontFamily: 'Cairo'),
                            keyboardType: TextInputType.visiblePassword,
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
                              labelText: 'الايميل',
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
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
                          TextFormField(
                            controller: fname_controller,
                            style: TextStyle(fontFamily: 'Cairo'),
                            keyboardType: TextInputType.text,
                            validator: (fname) {
                              if (fname.isEmpty) {
                                return 'يجب ملئ هذا الحقل';
                              }
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'الاسم الاول',
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            controller: lname_controller,
                            style: TextStyle(fontFamily: 'Cairo'),
                            keyboardType: TextInputType.text,
                            validator: (lname) {
                              if (lname.isEmpty) {
                                return 'يجب ملئ هذا الحقل';
                              }
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'العنوان',
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          TextFormField(
                            controller: mobile_controller,
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
                            controller: image_controller,
                            style: TextStyle(fontFamily: 'Cairo'),
                            keyboardType: TextInputType.url,
                            validator: (image) {
                              if (image.isEmpty) {
                                return 'يجب ملئ هذا الحقل';
                              }
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.image),
                              border: OutlineInputBorder(),
                              labelText: 'الصورة',
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
