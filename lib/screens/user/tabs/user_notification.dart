import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/notification.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/no_data.dart';

class UserNotificationsTab extends StatefulWidget {
  @override
  _UserNotificationsTabState createState() => _UserNotificationsTabState();
}

class _UserNotificationsTabState extends State<UserNotificationsTab> {
  Future<dynamic> _futureUser;
  List<dynamic> notificationsList;
  bool loading = true;
  bool isData = false;

  @override
  void initState() {
    super.initState();
    _futureUser = fetchUserNotifications();
  }

  @override
  void dispose() {
    super.dispose();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            if (snapshot.data.count != 0) {
              notificationsList = snapshot.data.orders;
              isData = true;
            } else if (snapshot.data.count == 0) {
              isData = false;
            }
            loading = false;
          } else {
            if (snapshot.data.message == 'غير مسموح لك بالدخول!!!') {
              showToast(snapshot.data.message, redColor);
              //Navigator.of(context).pushNamed('/admin/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if (snapshot.hasError) {
          showToast(snapshot.error, redColor);
        }
        return loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(gradientColor1),
                ),
              )
            : Scaffold(
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
                            isData
                                ? Column(
                                    children: notificationsList
                                        .map((e) => UserNotification(
                                              image: e['menu_food_id']['image'],
                                              time: e['time_to_finish'],
                                            ))
                                        .toList())
                                : NoData(
                                    text: 'لا يوجد اشعارات للان !!!',
                                  )
                          ],
                        ),
                      ])
                    ],
                  ),
                ),
              );
      },
    );
  }
}
