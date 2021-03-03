import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class OrderItem extends StatefulWidget {
  final Map<String, dynamic> order;
  OrderItem({this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: grayColormax),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  widget.order['user_id']['image'],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.order['user_id']['first_name'] +
                          ' ' +
                          widget.order['user_id']['last_name'],
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.info,
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
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
