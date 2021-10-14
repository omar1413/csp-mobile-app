import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:csp_mobile_app/api/dashboard_api.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/screens/subscription_tabs.dart';
import 'package:flutter/material.dart';

import '../models/DummyHomeItem.dart';
import 'cirular_slider_item.dart';

class CarouselCircle extends StatefulWidget {
  CarouselCircle({this.selectedPage}) : super();
  final Function(int)? selectedPage;

  final String title = "Home";

  @override
  CarouselCircleState createState() => CarouselCircleState();
}

class CarouselCircleState extends State<CarouselCircle> {
  static String routName = 'HomeScreen';

  List<HomeItem> homeCircularItems = [
    HomeItem(
      id: 1,
      title: "رصيد المحفظة",
      subtitle: "رصيدك الحالى",
      type: "ج.م",
      amount: 0,
      color: Color.fromRGBO(0x40, 0x91, 0x6C, 1.0),
      img: "",
      future: DashboardApi.getWalletAmount,
    ),
    HomeItem(
      id: 2,
      title: " عدد الاشتراكات ",
      subtitle: " عدد الاشتراكات ",
      type: "اشتراك ",
      amount: 2,
      color: Colors.orange,
      img: "",
      future: DashboardApi.getSubscriptionCount,
    ),
    HomeItem(
      id: 3,
      title: "عدد المركبات",
      subtitle: " عدد المركبات",
      type: "مركبات",
      amount: 2,
      color: Colors.red,
      img: "",
      future: DashboardApi.getVehicleCount,
    ),
  ];

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  void initHome() async {
    List<Subscription> subs = await DashboardApi.getfirstThreeSupscription();

    if (subs.length > 0) {
      setState(() {
        homeCircularItems.add(
          HomeItem(
            id: 4,
            title: "",
            subtitle: "اشتراك قارب على الانتهاء",
            type: "ايام ",
            amount: 1,
            max: 10,
            color: Colors.red,
            img: "img",
            future: () => Future(() {
              return subs[0].endDate!.difference(DateTime.now()).inDays;
            }),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    initHome();
    super.initState();
  }

  void _goToPage(BuildContext context, HomeItem ob) {
    if (ob.id == 1) {
      if (widget.selectedPage != null) {
        widget.selectedPage!(2);
      }
    } else if (ob.id == 2) {
      Navigator.pushNamed(context, SubscriptionTabs.routeName);
    } else if (ob.id == 3) {
      Navigator.pushNamed(context, SubscriptionTabs.routeName);
    } else if (ob.id == 4) {
      Navigator.pushNamed(context, SubscriptionTabs.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            viewportFraction: 0.4,
            aspectRatio: MediaQuery.of(context).size.height /
                MediaQuery.of(context).size.width *
                1.2,

            // height: MediaQuery.of(context).size.height*0.6,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: false,
            reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: true,
            scrollDirection: Axis.horizontal,
          ),
          items: homeCircularItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return FutureBuilder<int>(
                    future: item.future!(),
                    builder: (ctx, sn) {
                      if (sn.hasError) {
                        print(sn.error);
                      }
                      if (sn.hasData && sn.data != null) {
                        item.amount = sn.data!;
                        double max = item.amount.toDouble();
                        if (item.max != null) {
                          max = item.max!;
                        }
                        if (item.amount <= 0) {
                          max = 100;
                        }
                        return Cirular_slider(
                          item: item,
                          max: max,
                          onTap: (e) {
                            _goToPage(context, e);
                          },
                          initalValue: item.amount.toDouble(),
                        );
                      }

                      return Cirular_slider(
                        item: item,
                        onTap: (e) {
                          _goToPage(context, e);
                        },
                        initalValue: item.amount.toDouble(),
                      );
                    });
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(homeCircularItems, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
              ),
            );
          }),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    ));
  }
}
