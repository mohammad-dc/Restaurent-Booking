import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/dialogs/dialogs.dart';

class OrderItemUser extends StatefulWidget {
  String id;
  String foodName;
  double price;
  String image;
  int quantity;
  bool is_canceled;
  bool in_or_out;
  OrderItemUser({this.id, this.foodName, this.price, this.image, this.quantity, this.is_canceled, this.in_or_out});


  @override
  _OrderItemUserState createState() => _OrderItemUserState();
}

class _OrderItemUserState extends State<OrderItemUser> {
  Future<dynamic> _futureOrder;
  Color borderColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    borderColor = widget.is_canceled? redColor : grayColormax;
        print(widget.in_or_out);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureOrder,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data.success){
           showToast(snapshot.data.message, greenColor);
          } else {
            if(snapshot.data.message == 'غير مسموح لك بالدخول!!!'){
              showToast(snapshot.data.message, redColor);
              //Navigator.of(context).pushNamed('/admin/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if(snapshot.hasError){
          print(snapshot.error);
        }
        return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: borderColor),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.image,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodName,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(widget.price.toString(),
                            style: TextStyle(
                                color: grayColormax,
                                fontSize: 15.0,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.attach_money_rounded,
                          size: 15.0,
                          color: grayColormax,
                        )
                      ],
                    ),
                    Text(widget.quantity.toString() + 'x',
                        style: TextStyle(
                            color: grayColormax,
                            fontSize: 15.0,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 25,
                    color: grayColormax,
                  ),
                  onPressed: () {
                   widget.is_canceled?
                   showToast('لا يمكن التعديل على طلب تم الغاؤه مسبقا', redColor)
                   :
                    showGeneralDialog(context: context,
                      barrierColor: whiteColor,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                      pageBuilder: (BuildContext context, Animation first, Animation second){
                        return UserUpdateOrderDialog(id: widget.id, name: widget.foodName, price: widget.price, image: widget.image, quantity: widget.quantity, in_or_out: widget.in_or_out);
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 25,
                    color: grayColormax,
                  ),
                  onPressed: () {
                    widget.is_canceled == false? 
                    setState(() {
                      _futureOrder = cancelOrder(widget.id, !widget.is_canceled);
                      borderColor = redColor;
                    })
                    : showToast('الطلب بالفعل تم الغاؤه', redColor);
                  })
            ],
          )
        ],
      ),
    );
      },
    );
  }
}