import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/icon_text.dart';

class AdminSetTimeToOrderDialog extends StatefulWidget {
  final Map<String, dynamic> order;
  AdminSetTimeToOrderDialog({this.order});
  @override
  _AdminSetTimeToOrderDialogState createState() =>
      _AdminSetTimeToOrderDialogState();
}

class _AdminSetTimeToOrderDialogState extends State<AdminSetTimeToOrderDialog> {
  final _formKey = GlobalKey<FormState>();
  Future<dynamic> _futureOrder;
  bool isLoading = false;
  TextEditingController time_controller;
  @override
  void initState() {
    super.initState();
    time_controller =
        new TextEditingController(text: widget.order['time_to_finish'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureOrder,
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
                'معلومات الطلب',
                style: TextStyle(color: whiteColor, fontFamily: 'Cairo'),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        isLoading = true;
                        setState(() {
                          _futureOrder = setTimeOrders(
                            widget.order['_id'],
                            time_controller.text,
                          );
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
                      child: Column(children: [
                        Image.network(
                          widget.order['menu_food_id']['image'],
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          widget.order['menu_food_id']['name'],
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
                          text: widget.order['total_price'].toString(),
                          icon: Icon(Icons.attach_money_outlined),
                        ),
                        IconText(
                          text: widget.order['quantity'].toString(),
                          icon: Icon(Icons.money),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: time_controller,
                          style: TextStyle(fontFamily: 'Cairo'),
                          keyboardType: TextInputType.text,
                          validator: (quantity) {
                            if (quantity.isEmpty) {
                              return 'يجب ملئ هذا الحقل';
                            }
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.timelapse_outlined),
                            border: OutlineInputBorder(),
                            labelText: 'الوقت اللازم لتجهيز الطلب',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                widget.order['in_or_not']
                                    ? 'الطلب داخل المطعم'
                                    : 'الطلب خارج المطعم',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: blackColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400)),
                          ],
                        )
                      ]),
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
