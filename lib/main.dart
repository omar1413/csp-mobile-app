import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_screen.dart';
import 'package:csp_mobile_app/screens/main_screen.dart';
import 'package:csp_mobile_app/screens/recharge_wallet_screen.dart';
import 'package:csp_mobile_app/screens/road_data_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:csp_mobile_app/screens/onboard/onboard.dart';
import 'package:csp_mobile_app/screens/registration_screen.dart';
import 'package:csp_mobile_app/screens/subscription_taps.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/screens/transaction_list_screen.dart';
import 'package:csp_mobile_app/screens/transfer_money_screen.dart';
import 'package:csp_mobile_app/screens/vechile_list_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/registration_continue_screen.dart';
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
          primaryColor: Color.fromRGBO(0x40, 0x91, 0x6C, 1.0),
          primaryColorDark: Color.fromRGBO(0x20, 0x49, 0x36, 1.0),
          //colorScheme:schema.copyWith(secondary:const Color(0xFFB7E4C7)),
        ),
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          Vehiclemanagement.routeName: (ctx) => const Vehiclemanagement(),
          Subscriptionsmanagement.routeName: (ctx) => Subscriptionsmanagement(),
          RoadData.routeName: (ctx) => const RoadData(),
          MainScreen.routeName: (ctx) => MainScreen(),
          RechargeWalletScreen.routeName: (ctx) => RechargeWalletScreen(),
          TransferMoenyScreen.routeName: (ctx) => TransferMoenyScreen(),
          VechileListScreen.routeName: (ctx) => VechileListScreen(),
          SubscriptionDataScreen.routeName: (ctx) =>
              const SubscriptionDataScreen(),
          TransactionListScreen.routeName: (ctx) => TransactionListScreen(),
          SubscriptionTaps.routeName: (ctx) => SubscriptionTaps(),
        });
  }
}
