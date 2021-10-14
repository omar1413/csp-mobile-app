//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// ignore_for_file: file_names, prefer_const_constructors

import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/models/subscriptions_management_data_arg.dart';
import 'package:csp_mobile_app/screens/chat_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/screens/vechile_list_screen.dart';
import 'package:csp_mobile_app/screens/vehicle_management_screen.dart';
import 'package:csp_mobile_app/screens/wallet_screen.dart';
import 'package:csp_mobile_app/widets/custom_taps_item.dart';

import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class SubscriptionTabs extends StatefulWidget {
  @override
  State<SubscriptionTabs> createState() => _SubscriptionTabsState();
  static const routeName = '/SubscriptionTabs';
}

class _SubscriptionTabsState extends State<SubscriptionTabs> {
  int _indexOfSelectedScreen = 0;
  void _selectedTap(int index) {
    setState(() {
      _indexOfSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screensList = [
      {
        'page': Subscriptionsmanagement(
          args: SubscriptionsmanagementArg(
            getAllSubscriptions: SubscriptionApi.getAllSubscriptions,
          ),
        ),
        'title': 'ادارة الاشتراكات'
      },
      {'page': VechileListScreen(), 'title': '3الكود الشخصى'},
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              bottom: TabBar(
                unselectedLabelColor: Theme.of(context).primaryColor,
                indicatorColor: Colors.white,
                onTap: (index) {
                  _selectedTap(index);
                },
                tabs: [
                  Tab(
                      child: CustomTapIcon(
                          title: "اشتراكات",
                          icon: Icon(Icons.qr_code_scanner_sharp,
                              size: 30, color: Colors.white))),
                  Tab(
                    child: CustomTapIcon(
                        title: "المركبات",
                        icon: Icon(Icons.car_repair,
                            size: 35, color: Colors.white)),
                  ),
                ],
              ),
              title: const Text('ادارة الاشتراكات '),
            ),
            body: screensList[_indexOfSelectedScreen]['page'] as Widget),
      ),
    );
  }
}
