import 'package:flutter/material.dart';
class Vehiclemanagement extends StatelessWidget {
  static const routeName = '/VehiclemanagementScreen';
  const Vehiclemanagement({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ادارة الاشتراكات"),
      ),
      
    );
  }
}