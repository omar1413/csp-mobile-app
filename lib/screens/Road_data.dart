import 'package:flutter/material.dart';

class RoadData extends StatelessWidget {
  const RoadData({Key? key}) : super(key: key);
  static const routeName = '/roudDataScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيانات الطرق "),
      ),
    );
  }
}
