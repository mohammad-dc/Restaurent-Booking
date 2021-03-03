import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/order_item.dart';
import 'package:flutter_application_1/controllers/order.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/no_data.dart';

class AdminOrdersTab extends StatefulWidget {
  @override
  _AdminOrdersTabState createState() => _AdminOrdersTabState();
}

class _AdminOrdersTabState extends State<AdminOrdersTab> {
  Future<dynamic> _futureOrder;
  List<dynamic> ordersList;
  bool loading = true;
  bool isData = false;

  @override
  void initState() {
    super.initState();
    _futureOrder = fetchAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureOrder,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            if (snapshot.data.count != 0) {
              ordersList = snapshot.data.orders;
              isData = true;
            } else if (snapshot.data.count == 0) {
              isData = false;
            }
            loading = false;
          } else {
            if (snapshot.data.message == 'غير مسموح لك بالدخول!!!') {
              showToast(snapshot.data.message, redColor);
              Navigator.of(context).pushNamed('/admin/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(gradientColor1),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      'قائمة الطلبات ',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                        fontSize: 25.0,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          isData
                              ? Column(
                                  children: ordersList
                                      .map((e) => OrderItem(
                                            order: e,
                                          ))
                                      .toList())
                              : NoData(
                                  text: 'لا يوجد قائمة طعام للان !!!',
                                )
                        ],
                      ),
                    )
                  ],
                ));
      },
    );
  }
}
