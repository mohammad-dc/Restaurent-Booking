import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/controllers/admin.dart';
import 'package:flutter_application_1/widgets/toast.dart';

class AdminDataUpdateDialog extends StatefulWidget {
    final Map<String, dynamic> initData;
    AdminDataUpdateDialog({@required this.initData});
  @override
  _AdminDataUpdateDialogState createState() => _AdminDataUpdateDialogState();
}

class _AdminDataUpdateDialogState extends State<AdminDataUpdateDialog> {
  final _formKey = GlobalKey<FormState>();
  Future<dynamic> _futureAdmin;
  bool isLoading = false;
  TextEditingController email_controller;
  TextEditingController password_controller;
  TextEditingController name_controller;
  TextEditingController address_controller;
  TextEditingController image_controller;
  @override
  void initState(){
    super.initState();
    email_controller = new TextEditingController(text:widget.initData['email']);
    password_controller = new TextEditingController(text:widget.initData['password']);
    name_controller = new TextEditingController(text:widget.initData['name']);
    address_controller = new TextEditingController(text:widget.initData['address']);
    image_controller = new TextEditingController(text:widget.initData['image']);
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: gradientColor1,
          title: Text('تعديل معلومات المسؤول',
          style: TextStyle(color: whiteColor, fontFamily: 'Cairo'),),
          actions: [
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  isLoading = true;
                  setState(() {
                    _futureAdmin = updateAdmin(
                    widget.initData['_id'],
                    email_controller.text,
                    password_controller.text,
                    name_controller.text,
                    address_controller.text,
                    image_controller.text);
                    isLoading = false;
                  });
                }
              },
             child: isLoading? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                        ):Text('حفظ',
             style: TextStyle(color: whiteColor, fontFamily: 'Cairo', fontSize: 15.0, fontWeight: FontWeight.bold),))
          ],
        ),

        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Center(
            child: ListView(children: [
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
                          controller: name_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.text,
                          validator: (name) {
                            if (name.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.restaurant),
                            border: OutlineInputBorder(),
                            labelText: 'اسم المطعم',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          controller: address_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.text,
                          validator: (address) {
                            if (address.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on_rounded),
                            border: OutlineInputBorder(),
                            labelText: 'العنوان',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
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
                        FutureBuilder(
                          future: _futureAdmin,
                          builder: (context, snapshot){
                            if(snapshot.hasData){
                              if(snapshot.data.success){
                                print(snapshot.data.success);
                                showToast(snapshot.data.message, greenColor);
                              } else {
                                showToast(snapshot.data.message, redColor);
                              }
                              
                            } else if(snapshot.hasError){
                              print(snapshot.error);
                                return Container();
                            }
                            return Container();
                          },
                        )
                  ],
                ),
              )
            ],),),
        ),
      ),
    );
  }
}