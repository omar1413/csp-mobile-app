import 'package:flutter/material.dart';
class Subscriptionsmanagement extends StatelessWidget {
  static const routeName = '/subscriptionsmanagementScreen';
  const Subscriptionsmanagement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اداراة الاشتراكات "),
      ),
      
    );
  }
}