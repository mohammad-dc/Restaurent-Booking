import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/notification.dart';
import 'package:flutter_application_1/constants/colors.dart';

class UserNotificationsTab extends StatefulWidget {
  @override
  _UserNotificationsTabState createState() => _UserNotificationsTabState();
}

class _UserNotificationsTabState extends State<UserNotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'الاشعارات',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 25.0),
            ),
            ListView(shrinkWrap: true, children: [
              Column(
                children: [
                  UserNotification(),
                  UserNotification(),
                  UserNotification(),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
