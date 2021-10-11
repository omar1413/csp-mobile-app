//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// ignore_for_file: file_names

import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/wallet_screen.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/carousel_circle_slider.dart';
import 'package:csp_mobile_app/widets/custom_icon.dart';
import '../widets/carousel_square_slider.dart';
import 'package:csp_mobile_app/widets/profile.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:flutter/material.dart';
import '../widets/cirular_slider_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widets/profile.dart';
import '../screens/qrcode_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
  static const routeName = '/mainScreen';
}

class _MainScreenState extends State<MainScreen> {
  int _indexOfSelectedScreen = 0;
  void _selectedTap(int index) {
    setState(() {
      _indexOfSelectedScreen = index;
    });
  }

  Widget CustomIcon(Icon icon, String str) {
    return Column(children: [
      Expanded(child: icon),
      Expanded(
          child: Text(
        str,
        style: TextStyle(color: Colors.white),
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screensList = [
      {'page': ChatScreen(chatModel: ChatModel()), 'title': '4الكود الشخصى'},
      {'page': homeScreen(), 'title': '3الكود الشخصى'},
      {'page': WalletScreen(), 'title': 'محفظتى'},
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: kNavBarHeight,
          index: 1,
          backgroundColor: Colors.white,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Colors.green[900],
          items: const <Widget>[
            Icon(
              Icons.help_outline_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.home, size: 35, color: Colors.white),
            Icon(Icons.account_balance_wallet_outlined,
                size: 30, color: Colors.white),
          ],
          onTap: (index) {
            _selectedTap(index);
          },
        ),
        body: Container(
            child: screensList[_indexOfSelectedScreen]['page'] as Widget),
      ),
    );
  }
}
