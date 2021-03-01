import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/menu_item.dart';
import 'package:flutter_application_1/controllers/menu_food.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/no_data.dart';
import 'package:flutter_application_1/widgets/dialogs/admin/admin_food_add.dart';

class AdminMenuFoodTab extends StatefulWidget {
  @override
  _AdminMenuFoodTabState createState() => _AdminMenuFoodTabState();
}

class _AdminMenuFoodTabState extends State<AdminMenuFoodTab> {
  Future<dynamic> _adminMenuFood;
  List<dynamic> menuList;
  bool loading = true;
  bool isData = false;

  @override
  void initState(){
    super.initState();
    _adminMenuFood = fethcMenuFood();
  }

  @override
  void dispose(){
    super.dispose();
    loading = true;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _adminMenuFood,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data.success){
            if(snapshot.data.count != 0){
              menuList = snapshot.data.menu;
              isData = true;
            } else if(snapshot.data.count == 0){
              isData = false;
            }
            loading = false;
          } else {
            if(snapshot.data.message == 'غير مسموح لك بالدخول!!!'){
              showToast(snapshot.data.message, redColor);
              //Navigator.of(context).pushNamed('/admin/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if(snapshot.hasError){
          showToast(snapshot.error, redColor);
        }
        return loading? Center(
          child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(gradientColor1),
                        ),)
                        : 
                        Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'قائمة الطعام',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: 25.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    tooltip: 'اضافة وحبة للقائمة',
                    onPressed: () {
                       showGeneralDialog(context: context,
                        barrierColor: whiteColor,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                         pageBuilder: (BuildContext context, Animation first, Animation second){
                           return AdminAddMenuFoodDialog();
                         });
                    },
                    color: grayColormax,
                  ),
                ],
              ),
              isData?
              Column(
                children: menuList.map((e) => MenuItem(id: e['_id'], foodName: e['name'], price: e['price'].toDouble(), image: e['image'],)).toList()
              ): NoData(text: 'لا يوجد قائمة طعام للان !!!',)
            ],
          ),
        ),
      );
      }
    );
  }
}
