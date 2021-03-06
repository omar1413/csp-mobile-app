import 'dart:io';

import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/subscriptions_management_data_arg.dart';
import 'package:csp_mobile_app/models/vehicle.dart';

import 'package:csp_mobile_app/screens/main_screen.dart';
import 'package:csp_mobile_app/screens/recharge_wallet_screen.dart';
import 'package:csp_mobile_app/screens/road_data_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:csp_mobile_app/screens/onboard/onboard.dart';
import 'package:csp_mobile_app/screens/registration_screen.dart';
import 'package:csp_mobile_app/screens/subscription_tabs.dart';
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

import 'package:easy_localization/easy_localization.dart';

import 'package:path_provider/path_provider.dart';

int? isviewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

  getFilePath();
  saveFile();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

var files;

Future<String> getFilePath() async {
  Directory? appDocumentsDirectory = await getExternalStorageDirectory();

  String? appDocumentsPath = appDocumentsDirectory?.path; // 2
  String filePath = '$appDocumentsPath/ip.txt'; // 3

  print(filePath);

  return filePath;
}

void saveFile() async {
  File file = File(await getFilePath()); // 1
  if (!await file.exists()) {
    file.writeAsString(kHost); // 2

  } else {
    kHost = await file.readAsString();
  }
}

// void a() async {
//   var externalDirectoryPath = await ExtStorage.getExternalStorageDirectory();
//   print(externalDirectoryPath);
//   File file = File(externalDirectoryPath + "/csp-mob/csp.txt");
//   ExtStorage.getExternalStoragePublicDirectory()
//   if (await file.exists()) {
//     String str = await file.readAsString();
//     print("strrrrrrrr" + str);
//   } else {
//     final dir = await Directory(externalDirectoryPath + "/csp-mob").create();

//     final file = await File(dir.path + "csp.txt").create();

//     file.writeAsString("strrrrrrrrrrrrrrrrrrrrrrrrrr555");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale("ar"));

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0x40, 0x91, 0x6C, 1.0),
        primaryColorDark: Color.fromRGBO(0x20, 0x49, 0x36, 1.0),
        //colorScheme:schema.copyWith(secondary:const Color(0xFFB7E4C7)),
      ),
      home: OnBoard(),
      onGenerateRoute: (RouteSettings settings) {
        Map<String, WidgetBuilder> routes = {
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          RegisterContinueScreen.routeName: (ctx) => RegisterContinueScreen(),
          Vehiclemanagement.routeName: (ctx) => Vehiclemanagement(),
          Subscriptionsmanagement.routeName: (ctx) => Subscriptionsmanagement(
                args: settings.arguments as SubscriptionsmanagementArg,
              ),
          RoadData.routeName: (ctx) => RoadData(),
          MainScreen.routeName: (ctx) => MainScreen(),
          RechargeWalletScreen.routeName: (ctx) => RechargeWalletScreen(),
          TransferMoenyScreen.routeName: (ctx) => TransferMoenyScreen(),
          VechileListScreen.routeName: (ctx) => VechileListScreen(),
          SubscriptionDataScreen.routeName: (ctx) => SubscriptionDataScreen(
                subscription: settings.arguments as Subscription,
              ),
          TransactionListScreen.routeName: (ctx) => TransactionListScreen(),
          SubscriptionTabs.routeName: (ctx) => SubscriptionTabs(
                tabIndex: settings.arguments as int? ?? 0,
              ),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
      // routes: <String, WidgetBuilder>{
      //   RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
      //   Vehiclemanagement.routeName: (ctx) => const Vehiclemanagement(),
      //   Subscriptionsmanagement.routeName: (ctx) => Subscriptionsmanagement(),
      //   RoadData.routeName: (ctx) => const RoadData(),
      //   MainScreen.routeName: (ctx) => MainScreen(),
      //   RechargeWalletScreen.routeName: (ctx) => RechargeWalletScreen(),
      //   TransferMoenyScreen.routeName: (ctx) => TransferMoenyScreen(),
      //   VechileListScreen.routeName: (ctx) => VechileListScreen(),
      //   //SubscriptionDataScreen.routeName: (ctx) =>
      //   //  const SubscriptionDataScreen(),
      //   TransactionListScreen.routeName: (ctx) => TransactionListScreen(),
      //   SubscriptionTabs.routeName: (ctx) => SubscriptionTabs(),
      // },
    );
  }
}
