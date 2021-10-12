//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// ignore_for_file: file_names

import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management_screen.dart';
import 'package:csp_mobile_app/screens/wallet_screen.dart';
import 'package:csp_mobile_app/widets/custom_taps_item.dart';

import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class SubscriptionTaps extends StatefulWidget {
  @override
  State<SubscriptionTaps> createState() => _SubscriptionTapsState();
  static const routeName = '/SubscriptionTaps';
}

class _SubscriptionTapsState extends State<SubscriptionTaps> {
  int _indexOfSelectedScreen = 0;
  void _selectedTap(int index) {
    setState(() {
      _indexOfSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screensList = [
      {'page': Vehiclemanagement(), 'title': '3الكود الشخصى'},
      {'page': Subscriptionsmanagement(), 'title': 'ادارة الاشتراكات'},
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: kNavBarHeight,
          index: 0,
          backgroundColor: Colors.white,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColorDark,
          items: <Widget>[
            CustomTapIcon(
                title: "المركبات",
                icon: Icon(Icons.car_repair, size: 35, color: Colors.white)),
            CustomTapIcon(
                title: "اشتراكات",
                icon: Icon(Icons.qr_code_scanner_sharp,
                    size: 30, color: Colors.white)),
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
