import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/icon_text.dart';
import 'package:flutter_application_1/controllers/admin.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/dialogs/dialogs.dart';

class AdminDashboardTab extends StatefulWidget {
  @override
  _AdminDashboardTabState createState() => _AdminDashboardTabState();
}

class _AdminDashboardTabState extends State<AdminDashboardTab> {
  Future<dynamic> _adminData;
  Map<String, dynamic> mapAdminData;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _adminData = fetchAdmin();
  }

  @override
  void dispose() {
    super.dispose();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _adminData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.success) {
            mapAdminData = snapshot.data.admin;
            loading = false;
          } else {
            if (snapshot.data.message == 'غير مسموح لك بالدخول!!!') {
              showToast(snapshot.data.message, redColor);
              // Navigator.of(context).pushNamed('/admin/login');
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
                body: Column(
                  children: [
                    Image.network(
                      mapAdminData['image'],
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              mapAdminData['name'],
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  color: blackColor,
                                  fontSize: 25.0),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Future.delayed(Duration.zero, () {
                                  showGeneralDialog(
                                      context: context,
                                      barrierColor: whiteColor,
                                      barrierDismissible: true,
                                      barrierLabel:
                                          MaterialLocalizations.of(context)
                                              .modalBarrierDismissLabel,
                                      pageBuilder: (BuildContext context,
                                          Animation first, Animation second) {
                                        return AdminDataUpdateDialog(
                                            initData: mapAdminData);
                                      });
                                });
                              },
                              color: grayColormax,
                            )
                          ],
                        ),
                        IconText(
                          text: mapAdminData['address'],
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
      },
    );
  }
}
