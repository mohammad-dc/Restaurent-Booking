import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/icon_text.dart';

class AdminDashboardTab extends StatefulWidget {
  @override
  _AdminDashboardTabState createState() => _AdminDashboardTabState();
}

class _AdminDashboardTabState extends State<AdminDashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkCfMXru1njrK1tL1PkL1DiXhCpVWa--7AEw&usqp=CAU',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مطعم الملكي',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: 25.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                    color: grayColormax,
                  )
                ],
              ),
              IconText(
                text: 'رفيديا, نابلس',
                icon: Icon(Icons.location_on_rounded),
              ),
              Image.asset(
                'assets/images/admin.png',
                height: 170,
              )
            ]),
          )
        ],
      ),
    );
  }
}
