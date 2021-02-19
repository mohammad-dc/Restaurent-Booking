import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/order_item.dart';

class AdminOrdersTab extends StatefulWidget {
  @override
  _AdminOrdersTabState createState() => _AdminOrdersTabState();
}

class _AdminOrdersTabState extends State<AdminOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          children: [
            Text(
              'قائمة الطلبات ',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: 25.0,
              ),
            ),
            Container(
              child: Column(
                children: [OrderItem(), OrderItem(), OrderItem()],
              ),
            )
          ],
        ));
  }
}
