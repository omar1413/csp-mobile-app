import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'cirular_slider_item.dart';

class CarouselCircle extends StatefulWidget {
  CarouselCircle() : super();

  final String title = "Home";

  @override
  CarouselCircleState createState() => CarouselCircleState();
}

class CarouselCircleState extends State<CarouselCircle> {
  static String routName = 'HomeScreen';

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
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
          items: DummyHomeCircularItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return FutureBuilder<Response>(
                    future: item.future!(),
                    builder: (ctx, sn) {
                      print(sn);
                      if (sn.hasError) {
                        print(sn.error);
                      }
                      if (sn.hasData && sn.data != null) {
                        print(
                            "status code : " + sn.data!.statusCode.toString());
                        if (sn.data!.statusCode == 200) {
                          print("haaaaaaaaaaaaas data");
                          item.amount = jsonDecode(sn.data!.body)["data"];
                          return Cirular_slider(
                            item: item,
                            max: item.amount.toDouble(),
                          );
                        }
                      }
                      return Cirular_slider(item: item);
                    });
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(DummyHomeCircularItems, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.green[600] : Colors.grey[300],
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
