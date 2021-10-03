//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:csp_mobile_app/screens/road_data.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/screens/vehicle_management.dart';
import 'package:csp_mobile_app/widets/carousel_circle_slider.dart';
import 'package:csp_mobile_app/widets/carousel_square_slider.dart';
import 'package:csp_mobile_app/widets/profile.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:flutter/material.dart';

import '../widets/profile.dart';
import '../widets/custom_text_line.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Widget _textField(String str) {
    return Container(
      height: 40,
      width: 300,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        textAlign: TextAlign.end,
        cursorColor: Colors.green[600],
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          labelText: str,
        ),
      ),
    );
  }

  Widget _textBtn(String str) {
    return Container(
      height: 35,
      alignment: Alignment.topLeft,
      // padding: EdgeInsets.symmetric(horizontal:),
      child: TextButton(
          onPressed: () {},
          child: Text(
            str,
            style: TextStyle(
                color: Colors.green[600],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal),
          )),
    );
  }

  Widget _text(String str, BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(3),
          child: Text(
            str,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(3),
          height: 4,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
                width: width,
                child: Stack(children: [
                  Container(
                    child: Image.asset('assets/images/login.png',
                        fit: BoxFit.fill),
                    height: height * 0.42,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 20,
                      right: 8,
                      left: 30,
                      child: Container(child: ProfileWidget())),
                  Container(
                      padding: EdgeInsets.only(top: 90),
                      child: CarouselCircle()),
                ]),
              ),
              CustomTextLine(text: "المعلومات"),
              CarouselSquare(),
              CustomTextLine(text: "الخدمات"),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Service(
                      id: "1",
                      title: "ادارة المركبات",
                      image: "assets/images/car.png",
                      function: () {
                        Navigator.of(context).pushNamed(
                          Vehiclemanagement.routeName,
                        );
                      },
                    ),
                    Service(
                      id: "2",
                      title: "ادارة الأشتراكات",
                      image: "assets/images/barcode.png",
                      function: () {
                        Navigator.of(context).pushNamed(
                          Subscriptionsmanagement.routeName,
                        );
                      },
                    ),
                    Service(
                      id: "3",
                      title: "بيانات الطرق",
                      image: "assets/images/direction.png",
                      function: () {
                        Navigator.of(context).pushNamed(
                          RoadData.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
