import 'package:csp_mobile_app/screens/Main_screen.dart';
import 'package:csp_mobile_app/screens/QrCode_screen.dart';
import 'package:csp_mobile_app/screens/road_data.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:csp_mobile_app/screens/registration_screen.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/screens/vehicle_management.dart';
import 'package:flutter/material.dart';
import './widets/carouselCircle_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme schema = Theme.of(context).colorScheme;

    return MaterialApp(
        theme: ThemeData(
          primaryColorLight: Colors.green[400],
          primaryColor: Colors.green[600],
          primaryColorDark: Colors.green[900],
          //primaryColor:Color.fromRGBO(0xB7, 0xE4, 0xC7, 1.0)
          //colorScheme:schema.copyWith(secondary:const Color(0xFFB7E4C7)),
          // primaryColorLight:const Color(0xFFB7E4C7),
          // primaryColorDark:const Color(0xFF1B4332),
        ),
        home: MainScreen(),
        routes: <String, WidgetBuilder>{
          registrationScreen.routeName: (ctx) => registrationScreen(),
          Vehiclemanagement.routeName: (ctx) => Vehiclemanagement(),
          Subscriptionsmanagement.routeName: (ctx) => Subscriptionsmanagement(),
          RoudData.routeName: (ctx) => RoudData(),
        });
  }
}
