import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/user_info.dart';
import 'package:flutter_application_1/controllers/user.dart';
import 'package:flutter_application_1/widgets/toast.dart';
import 'package:flutter_application_1/widgets/dialogs/dialogs.dart';

class UserDashboardTab extends StatefulWidget {
  @override
  _UserDashboardTabState createState() => _UserDashboardTabState();
}

class _UserDashboardTabState extends State<UserDashboardTab> {
  Future<dynamic> _futureUser;
  Map<String, dynamic> mapUserData;
  bool loading = true;

  @override
  void initState(){
    super.initState();
    _futureUser = fetchUser();
  }

  @override
  void dispose(){
    super.dispose();
    loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureUser,
      builder: (context, snapshot){
        if(snapshot.hasData){
          if(snapshot.data.success){
            mapUserData = snapshot.data.user;
            loading = false; 
          } else {
            if(snapshot.data.message == 'غير مسموح لك بالدخول!!!'){
              showToast(snapshot.data.message, redColor);
              Navigator.of(context).pushNamed('/user/login');
            }
            showToast(snapshot.data.message, redColor);
          }
        }
        if(snapshot.hasError){
          print(snapshot.error);
        }
        return  loading? Center(
          child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(gradientColor1),
                        ),):
          Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.network(
                              mapUserData['image'],
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mapUserData["first_name"] + ' ' + mapUserData["last_name"],
                                  style: TextStyle(
                                      color: blackColor,
                                      fontSize: 20.0,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  mapUserData["email"],
                                  style: TextStyle(
                                      color: grayColormax,
                                      fontSize: 10.0,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showGeneralDialog(context: context,
                          barrierColor: whiteColor,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                           pageBuilder: (BuildContext context, Animation first, Animation second){
                             return UserDataUpdateDialog(initData: mapUserData);
                           });
                        },
                        color: grayColormax,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'معلومات الحساب',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        fontSize: 25.0),
                  ),
                  UserInfoBox(
                    icon: Icon(
                      Icons.lock,
                      color: grayColormax,
                      size: 17,
                    ),
                    headline: 'كلمة السر:',
                    value: mapUserData['password'],
                  ),
                  UserInfoBox(
                    icon: Icon(
                      Icons.phone,
                      color: grayColormax,
                      size: 17,
                    ),
                    headline: 'رقم الهاتف:',
                    value: mapUserData['mobile'],
                  ),
                ],
              ),
          ),
      );
      },
    );
  }
}
