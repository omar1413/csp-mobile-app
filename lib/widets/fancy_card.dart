import 'package:csp_mobile_app/constant.dart';
import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Widget child;
  final String imagePath;
  const FancyCard({Key? key, required this.child, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.22,
        width: width * 0.88,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),

        // color: Colors.white,
        child: child);
  }
}
