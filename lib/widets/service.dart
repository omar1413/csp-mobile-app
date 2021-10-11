import 'package:csp_mobile_app/screens/road_data_screen.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management_screen.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Function()? onPress;

  Service({
    required this.id,
    required this.title,
    required this.image,
    this.onPress,
  });

  void selectedMeal(BuildContext ctx) {
    if (id == "1") {
      Navigator.of(ctx).pushNamed(
        Vehiclemanagement.routeName,
      );
    }
    if (id == "2") {
      Navigator.of(ctx).pushNamed(Subscriptionsmanagement.routeName);
    }
    if (id == "3") {
      Navigator.of(ctx).pushNamed(RoadData.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: onPress,
        child: Column(children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Image.asset(image),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.bold, color: Colors.green),
          )
        ]),
      ),
    );
  }
}
