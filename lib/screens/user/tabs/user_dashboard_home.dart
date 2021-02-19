import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/user_info.dart';

class UserDashboardTab extends StatefulWidget {
  @override
  _UserDashboardTabState createState() => _UserDashboardTabState();
}

class _UserDashboardTabState extends State<UserDashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
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
                          'https://topmeaning.com/english/images/img/EN/g/guy.jpg',
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
                              'همام صباح',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 20.0,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'hammam.sabaah@gmail.com',
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
                    icon: Icon(Icons.more_vert_outlined),
                    onPressed: () {},
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
                value: '123456789',
              ),
              UserInfoBox(
                icon: Icon(
                  Icons.phone,
                  color: grayColormax,
                  size: 17,
                ),
                headline: 'رقم الهاتف:',
                value: '0591234567',
              ),
            ],
          )),
    );
  }
}
