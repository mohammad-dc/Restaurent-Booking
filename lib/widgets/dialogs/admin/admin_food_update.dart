import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/menu_food.dart';
import 'package:flutter_application_1/widgets/toast.dart';

class AdminUpdateMenuFoodDialog extends StatefulWidget {
    final Map<String, dynamic> initData;
    AdminUpdateMenuFoodDialog({@required this.initData});
  @override
  _AdminUpdateMenuFoodDialogState createState() => _AdminUpdateMenuFoodDialogState();
}

class _AdminUpdateMenuFoodDialogState extends State<AdminUpdateMenuFoodDialog> {
  final _formKey = GlobalKey<FormState>();
  Future<dynamic> _futureMenuFood;
  bool isLoading = false;
  TextEditingController name_controller;
  TextEditingController price_controller;
  TextEditingController image_controller;
  @override
  void initState(){
    super.initState();
    name_controller = new TextEditingController(text:widget.initData['name']);
    price_controller = new TextEditingController(text:widget.initData['price']);
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
                    _futureMenuFood = updateMenuFood(
                    widget.initData['_id'],
                    name_controller.text,
                    price_controller.text,
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
                          controller: name_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.text,
                           validator: (name) {
                            if (name.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            }
                          },
                          obscureText: false,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.food_bank_sharp),
                            border: OutlineInputBorder(),
                            labelText: 'الاسم',
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          controller: price_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.text,
                          validator: (price) {
                            if (price.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.monetization_on),
                            border: OutlineInputBorder(),
                            labelText: 'السعر',
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
                          future: _futureMenuFood,
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