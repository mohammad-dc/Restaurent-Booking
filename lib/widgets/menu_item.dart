import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/menu_food.dart';
import 'package:flutter_application_1/widgets/toast.dart';

class MenuItem extends StatefulWidget {
  String id;
  String foodName;
  double price;
  String image;
  MenuItem({this.id, this.foodName, this.price, this.image});


  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
   Future<dynamic> _futureMenuFood;
  @override
  Widget build(BuildContext context) {
    double p = widget.price;
    return FutureBuilder(
      future: _futureMenuFood,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data.success){
            print(snapshot.data.success);
            showToast(snapshot.data.message, greenColor);
          } else {
            if(snapshot.data.message == 'غير مسموح لك بالدخول!!!'){
              showToast(snapshot.data.message, redColor);
              Navigator.of(context).pushNamed('/admin/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if(snapshot.hasError){
           print(snapshot.error);
        }
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        height: 90,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(width: .5, color: grayColormax),
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
                          Text( '$p',
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
                      )
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
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 25,
                      color: grayColormax,
                    ),
                    onPressed: () {
                      setState(() {
                         _futureMenuFood = deleteMenuFood(widget.id);
                      });
                    })
              ],
            )
          ],
        ),
      );
      });
  }
}