import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/icon_text.dart';

class UserAddOrderDialog extends StatefulWidget {
  final String menu_food_id;
  final String image;
  final double price;
  final String name;
  UserAddOrderDialog({this.menu_food_id, this.image, this.price, this.name});

  @override
  _UserAddOrderDialogState createState() => _UserAddOrderDialogState();
}

class _UserAddOrderDialogState extends State<UserAddOrderDialog> {
  final _formKey = GlobalKey<FormState>();
  Future<dynamic> _futureOrder;
  bool isLoading = false;
  TextEditingController quantity_controller;
  bool switch_val = false;
  
  onSwitchValueChanged(bool newVal){
    setState(() {
      switch_val = newVal;
    });
  }
  @override
  void initState(){
    super.initState();
    quantity_controller = new TextEditingController(text:'');
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
              future: _futureOrder,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data.success){
                    showToast(snapshot.data.message, greenColor);
                  } else {
                    showToast(snapshot.data.message, redColor);
                  }
                              
                } else if(snapshot.hasError){
                  print(snapshot.error);
                }
                 return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: gradientColor1,
          title: Text('اضافة طلب',
          style: TextStyle(color: whiteColor, fontFamily: 'Cairo'),),
          actions: [
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  isLoading = true;
                  setState(() {
                    _futureOrder = addOrder(
                    widget.menu_food_id,
                    double.parse( quantity_controller.text) * widget.price,
                    quantity_controller.text,
                    switch_val);
                    isLoading = false;
                  });
                }
              },
             child: isLoading? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                        ):Text('اضافة',
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
                      Image.network(
                        widget.image,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      IconText(
                        text: widget.price.toString(),
                        icon: Icon(Icons.attach_money_outlined),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                          controller: quantity_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.number,
                          validator: (quantity) {
                            if (quantity.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            } else if (int.parse(quantity) < 1){
                              return 'لايمكن ادخال قيمة اقل من 1';
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.money),
                            border: OutlineInputBorder(),
                            labelText: 'الكمية',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'طلب داخل المطعم او خارجه؟',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              color: blackColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                            )
                          ),
                          Switch(
                          value: switch_val,
                          onChanged: (newVal){
                            onSwitchValueChanged(newVal);
                          }),
                        ] 
                        ),
                  ],
                ),
              )
            ],),),
        ),
      ),
    );           
              },
            );
  }
}