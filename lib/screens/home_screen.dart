//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:async';

import 'package:csp_mobile_app/api/dashboard_api.dart';
import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/api/wether_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/subscriptions_data.dart';
import 'package:csp_mobile_app/models/subscriptions_management_data_arg.dart';
import 'package:csp_mobile_app/models/weather_data.dart';
import 'package:csp_mobile_app/screens/road_data_screen.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/screens/subscription_tabs.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/screens/vechile_list_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management_screen.dart';
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

class HomeScreen extends StatefulWidget {
  final Function(int)? selectedPage;

  HomeScreen({this.selectedPage});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  StreamController<List<Subscription>?> subStream = StreamController();

  @override
  void initState() {
    loadFirstThreeSubscription();
    WetherApi.getWetherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      Container(
                          child: CarouselCircle(
                        selectedPage: widget.selectedPage,
                      )),
                    ],
                  ),
                ),
                CustomTextLine(text: "الأخبار"),
                News(),
                FutureBuilder(
                    future: WetherApi.getWetherData(),
                    builder: (ctx, AsyncSnapshot<WeatherData> sn) {
                      if (!sn.hasData || sn.data == null) {
                        return Container();
                      }

                      if (sn.hasError) {
                        return Container();
                      }

                      return CarouselSquare(
                        weatherData: sn.data!,
                      );
                    }),

                // CustomTextLine(text: "المعلومات"),
                // CarouselSquare(),
                CustomTextLine(text: "الخدمات"),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Service(
                          id: "2",
                          title: "ادارة الأشتراكات",
                          image: "assets/images/barcode.png",
                          onPress: () async {
                            await Navigator.of(context).pushNamed(
                              SubscriptionTabs.routeName,
                            );
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: Service(
                          id: "3",
                          title: "بيانات الطرق",
                          image: "assets/images/direction.png",
                          onPress: () async {
                            await Navigator.of(context).pushNamed(
                              RoadData.routeName,
                            );
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder(

                    // future: DashboardApi.getfirstThreeSupscription(),
                    stream: subStream.stream,
                    builder: (ctx, AsyncSnapshot<List<Subscription>?> sn) {
                      if (!sn.hasData || sn.data == null) {
                        return Container();
                      }
                      if (sn.data!.length == 0) {
                        return Container();
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextLine(text: "الاشتراكات"),
                              CustomTextButton(
                                  str: "عرض الكل",
                                  onPressed: () async {
                                    await Navigator.pushNamed(context,
                                        Subscriptionsmanagement.routeName,
                                        arguments: SubscriptionsmanagementArg(
                                            getAllSubscriptions: DashboardApi
                                                .getfirstThreeSupscription,
                                            showAppBar: true));
                                    setState(() {});
                                  },
                                  size: 16,
                                  color: Colors.green,
                                  td: TextDecoration.none)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Card(
                              color: Colors.white60,
                              elevation: 1.5,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              borderOnForeground: true,
                              shadowColor: Colors.black,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: sn.data!
                                    .map((e) => SubscripeItem(
                                          item: e,
                                          onTap: (e) async {
                                            await Navigator.pushNamed(
                                              context,
                                              SubscriptionDataScreen.routeName,
                                              arguments: e,
                                            );

                                            // loadFirstThreeSubscription();
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadFirstThreeSubscription() async {
    subStream.add(null);
    List<Subscription> subs = await DashboardApi.getfirstThreeSupscription();

    subStream.add(subs);
  }

  @override
  void dispose() {
    subStream.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    loadFirstThreeSubscription();
    super.didChangeDependencies();
  }
}
