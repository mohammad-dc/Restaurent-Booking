import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'tabs/tabs.dart';

class AdminTabsRoot extends StatefulWidget {
  @override
  _AdminTabsRootState createState() => _AdminTabsRootState();
}

class _AdminTabsRootState extends State<AdminTabsRoot> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
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
                    'قائمة الطعام',
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
              AdminDashboardTab(),
              AdminMenuFoodTab(),
              AdminOrdersTab()
            ],
          ),
        ),
      ),
    );
  }
}
