//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// ignore_for_file: file_names

import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/wallet_screen.dart';
import 'package:csp_mobile_app/widets/custom_taps_item.dart';

import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  static int WalletPage = 2;

  @override
  State<MainScreen> createState() => _MainScreenState();
  static const routeName = '/mainScreen';
}

class _MainScreenState extends State<MainScreen> {
  int _indexOfSelectedScreen = 1;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  void _selectedTap(int index) {
    setState(() {
      _indexOfSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screensList = [
      {'page': ChatScreen(chatModel: ChatModel()), 'title': 'مساعدة'},
      {
        'page': HomeScreen(
          selectedPage: (int val) => setState(
            () {
              print("vaaal $val");
              _indexOfSelectedScreen = val;
              _bottomNavigationKey.currentState?.setPage(val);
            },
          ),
        ),
        'title': 'هوم'
      },
      {'page': WalletScreen(), 'title': 'محفظتى'},
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: kNavBarHeight,
          index: 1,
          backgroundColor: Colors.white,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColorDark,
          items: <Widget>[
            CustomTapIcon(
                title: "مساعدة",
                icon: const Icon(
                  Icons.help_outline_rounded,
                  size: 30,
                  color: Colors.white,
                )),
            CustomTapIcon(
                title: "",
                icon: const Icon(Icons.home, size: 35, color: Colors.white)),
            CustomTapIcon(
              title: "محفظتى",
              icon: const Icon(Icons.account_balance_wallet_outlined,
                  size: 30, color: Colors.white),
            )
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
