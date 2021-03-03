import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/widgets/dialogs/dialogs.dart';

class MenuItemUser extends StatelessWidget {
  String id;
  String foodName;
  double price;
  String image;
  MenuItemUser({this.id, this.foodName, this.price, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: .5, color: grayColormax),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text('$price',
                            style: TextStyle(
                                color: grayColormax,
                                fontSize: 15.0,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.attach_money_rounded,
                          size: 15.0,
                          color: grayColormax,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 25,
                color: grayColormax,
              ),
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    barrierColor: whiteColor,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    pageBuilder: (BuildContext context, Animation first,
                        Animation second) {
                      return UserAddOrderDialog(
                          image: image,
                          price: price,
                          name: foodName,
                          menu_food_id: id);
                    });
              }),
        ],
      ),
    );
  }
}
