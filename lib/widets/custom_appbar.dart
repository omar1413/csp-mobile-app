import 'package:flutter/material.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  return AppBar(
    titleSpacing: width * 0.4,
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    title: Text(title),
    backgroundColor: Theme.of(context).primaryColor,

    //leading: IconButton(onPressed: (){}, icon: icon),
  );
}
