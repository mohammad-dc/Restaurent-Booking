import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'tabs/tabs.dart';

class UserTabsRoot extends StatefulWidget {
  @override
  _UserTabsRootState createState() => _UserTabsRootState();
}

class _UserTabsRootState extends State<UserTabsRoot> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: gradientColor1,
            bottom: TabBar(
              indicatorColor: whiteColor,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  child: Text(
                    'الرئيسية',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.fastfood_sharp),
                  child: Text(
                    'الوجبات',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.receipt),
                  child: Text(
                    'الطلبات',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.notifications_active),
                  child: Text(
                    'الاشعارات',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                ),
              ],
            ),
            title: Text(
              'لوحة التحكم',
              style:
                  TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
            ),
          ),
          body: TabBarView(
            children: [
              UserDashboardTab(),
              UserMenuFoodTab(),
              UserOrderTab(),
              UserNotificationsTab()
            ],
          ),
        ),
      ),
    );
  }
}
