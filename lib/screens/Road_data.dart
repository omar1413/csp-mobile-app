import 'package:flutter/material.dart';
class RoudData extends StatelessWidget {
  const RoudData({ Key? key }) : super(key: key);
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