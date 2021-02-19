import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class UserNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: grayColormax),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'سيتم تحضير الوجبة خلال 5 دقائق',
          style:
              TextStyle(fontFamily: 'Cairo', color: blackColor, fontSize: 16),
        )
      ]),
    );
  }
}
