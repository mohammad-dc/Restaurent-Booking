import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/order_user.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/no_data.dart';

class UserOrderTab extends StatefulWidget {
  @override
  _UserOrderTabState createState() => _UserOrderTabState();
}

class _UserOrderTabState extends State<UserOrderTab> {
  Future<dynamic> _futureOrder;
  List<dynamic> orderList;
  bool loading = true;
  bool isData = false;

  @override
  void initState(){
    super.initState();
    _futureOrder = fetchUserOrders();
  }

  @override
  void dispose(){
    super.dispose();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureOrder,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data.success){
            print(snapshot.data.success);
            print(snapshot.data.orders);
             if(snapshot.data.count != 0){
              orderList = snapshot.data.orders;
              isData = true;
            } else if(snapshot.data.count == 0){
              isData = false;
            }
            loading = false; 
          } else {
            if(snapshot.data.message == 'غير مسموح لك بالدخول!!!'){
              showToast(snapshot.data.message, redColor);
              Navigator.of(context).pushNamed('/user/login');
            }
            showToast(snapshot.data.message, redColor);
            loading = false; 
          }
        }
        if(snapshot.hasError){
          print(snapshot.error);
        }
        return loading? Center(
          child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(gradientColor1),
                        ),)
                        :Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'طلباتي',
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 25.0),
            ),
            ListView(shrinkWrap: true, children: [
                 isData?
              Column(
                children: orderList.map((e) => OrderItemUser(id: e['_id'], foodName: e['menu_food_id']['name'], price: e['menu_food_id']['price'].toDouble(), image: e['menu_food_id']['image'], quantity: e['quantity'],)).toList()
              ): NoData(text: 'لا يوجد قائمة طعام للان !!!',)
            ])
          ],
        ),
      ),
    );
      },
    );
  }
}
