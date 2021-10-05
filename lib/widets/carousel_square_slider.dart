import 'package:carousel_slider/carousel_slider.dart';
import 'square_item.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'cirular_slider_item.dart';

class CarouselSquare extends StatefulWidget {
  CarouselSquare() : super();
  @override
  CarouselSquareState createState() => CarouselSquareState();
}

class CarouselSquareState extends State<CarouselSquare> {
  static String routName = 'HomeScreen';

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        /*Square_slider(
          item: DummyHomeSquareItems[0],
        ),
        Square_slider(item: DummyHomeSquareItems[1]),*/

        Container(
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: [
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.75),
                    Colors.black,
                  ],
                  begin: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "السرعة الأن",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Positioned(
                top: 74,
                right: 40,
                child: Text(
                  "120".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24),
                )),
            Positioned(
                top: 50,
                left: 10,
                child: Container(
                    height: 80,
                    child: Image.asset("assets/images/download-speed.png"))),
            Positioned(
                top: 90,
                right: 80,
                child: Text(
                  "كم/س".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 11),
                )),
          ]),
        ),
        Container(
          child: Stack(children: [
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.withOpacity(0.75),
                    Colors.orange,
                  ],
                  begin: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "مشمس",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Positioned(
                top: 70,
                right: 40,
                child: Text(
                  "28 ْ".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26),
                )),
            Positioned(
                top: 90,
                right: 70,
                child: Text(
                  "س".toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 11),
                )),
            Positioned(
                top: 50,
                left: 10,
                child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/weather-app.png")))
          ]),
        ),
        Container(
          child: Stack(children: [
            Container(
              height: 100,
              width: width * 0.45,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.75),
                    Theme.of(context).primaryColor,
                  ],
                  begin: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "حادث على طريق صلاح سالم",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Positioned(
              top: 40,
              right: 10,
              child: Container(
                height: height * 0.15,
                width: width * 0.45,
                padding: const EdgeInsets.all(5),
                child: Text(
                  "لقى شخص مصرعه، فيما أصيب 7 أشخاص آخرين في حادث تصادم سيارة ملاكي بجرار زراعي بالطريق الدائري بمركز مغاغة شمال المنيا، وتم نقل المصابين والجثة إلى المستشفي تحت تصرف النيابة",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 11),
                ),
              ),
            ),
          ]),
        ),
      ] /*map<Widget>(DummyHomeSquareItems, (index, url) {
                return Square_slider(item: DummyHomeSquareItems[index]);
              }*/
          ),
    );
  }
}
