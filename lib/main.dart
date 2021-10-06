import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_page.dart';
import 'package:csp_mobile_app/screens/main_screen.dart';
import 'package:csp_mobile_app/screens/recharge_wallet_screen.dart';
import 'package:csp_mobile_app/screens/road_data.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:csp_mobile_app/screens/onboard/onboard.dart';
import 'package:csp_mobile_app/screens/registration_screen.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/screens/transaction_list_screen.dart';
import 'package:csp_mobile_app/screens/transfer_money_screen.dart';
import 'package:csp_mobile_app/screens/vechile_list_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/registration_continue.dart';
import 'screens/subscription_data_screen.dart';
import 'widets/carousel_circle_slider.dart';

int? isviewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
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
            primarySwatch: Colors.green
            //primaryColor:Color.fromRGBO(0xB7, 0xE4, 0xC7, 1.0)
            //colorScheme:schema.copyWith(secondary:const Color(0xFFB7E4C7)),
            // primaryColorLight:const Color(0xFFB7E4C7),
            //primaryColorDark:const Color(0xFF1B4332),
            ),
        home: MainScreen(),
        routes: <String, WidgetBuilder>{
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          Vehiclemanagement.routeName: (ctx) => Vehiclemanagement(),
          Subscriptionsmanagement.routeName: (ctx) => Subscriptionsmanagement(),
          RoadData.routeName: (ctx) => RoadData(),
          MainScreen.routeName: (ctx) => MainScreen(),
          RechargeWalletScreen.routeName: (ctx) => RechargeWalletScreen(),
          TransferMoenyScreen.routeName: (ctx) => TransferMoenyScreen(),
          VechileListScreen.routeName: (ctx) => VechileListScreen(),
          SubscriptionDataScreen.routeName: (ctx) => SubscriptionDataScreen(),
          TransactionListScreen.routeName: (ctx) => TransactionListScreen(),
        });
  }
}
