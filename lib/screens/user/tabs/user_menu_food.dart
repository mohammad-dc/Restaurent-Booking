import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/menu_food_item_user.dart';

class UserMenuFoodTab extends StatefulWidget {
  @override
  _UserMenuFoodTabState createState() => _UserMenuFoodTabState();
}

class _UserMenuFoodTabState extends State<UserMenuFoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'قائمة الطعام',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 25.0),
            ),
            ListView(shrinkWrap: true, children: [
              Column(
                children: [
                  MenuItemUser(
                    foodName: 'برغر الملكي',
                    price: 20,
                    image:
                        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
                  ),
                  MenuItemUser(
                    foodName: 'برغر الملكي',
                    price: 20,
                    image:
                        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
                  ),
                  MenuItemUser(
                    foodName: 'برغر الملكي',
                    price: 20,
                    image:
                        'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
