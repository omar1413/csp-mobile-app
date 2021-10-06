//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:csp_mobile_app/models/news_dara.dart';
import 'package:csp_mobile_app/models/subscriptions_data.dart';
import 'package:csp_mobile_app/screens/road_data.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/screens/vechile_list_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management.dart';
import 'package:csp_mobile_app/widets/carousel_circle_slider.dart';
import 'package:csp_mobile_app/widets/carousel_square_slider.dart';
import 'package:csp_mobile_app/widets/custom_textButton.dart';
import 'package:csp_mobile_app/widets/new_item.dart';
import 'package:csp_mobile_app/widets/news_list.dart';
import 'package:csp_mobile_app/widets/profile.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:csp_mobile_app/widets/subscripe_item.dart';
import 'package:flutter/material.dart';

import '../widets/profile.dart';
import '../widets/custom_text_line.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //info
              Container(
                width: width,
                margin: EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
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
                  image: DecorationImage(
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(child: ProfileWidget()),
                    Container(child: CarouselCircle()),
                  ],
                ),
              ),
              //news
              CustomTextLine(text: "الأخبار"),
              News(),
              //info
              CustomTextLine(text: "المعلومات"),
              CarouselSquare(),
              //servises
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
                      onPress: () {
                        Navigator.of(context).pushNamed(
                          VechileListScreen.routeName,
                        );
                      },
                    ),
                    Service(
                      id: "2",
                      title: "ادارة الأشتراكات",
                      image: "assets/images/barcode.png",
                      onPress: () {
                        Navigator.of(context).pushNamed(
                          Subscriptionsmanagement.routeName,
                        );
                      },
                    ),
                    Service(
                      id: "3",
                      title: "بيانات الطرق",
                      image: "assets/images/direction.png",
                      onPress: () {
                        Navigator.of(context).pushNamed(
                          RoadData.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
              //subscription
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextLine(text: "الاشتراكات"),
                    CustomTextButton(
                        str: "عرض الكل",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Subscriptionsmanagement.routeName);
                        },
                        size: 16,
                        color: Colors.green,
                        td: TextDecoration.none)
                  ],
                ),
              ),
              Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubscripeItem(
                      item: DummySubscriptionItems[0],
                    ),
                    SubscripeItem(
                      item: DummySubscriptionItems[1],
                    ),
                    SubscripeItem(
                      item: DummySubscriptionItems[2],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
