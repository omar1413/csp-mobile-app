//import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:csp_mobile_app/models/chat_model.dart';
import 'package:csp_mobile_app/screens/chat_page.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/wallet_screen.dart';
import 'package:csp_mobile_app/widets/carousel_circle_slider.dart';
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
  Widget _textField(String str) {
    return Container(
      height: 40,
      width: 300,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        textAlign: TextAlign.end,
        cursorColor: Colors.green[600],
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          labelText: str,
        ),
      ),
    );
  }

  Widget _textBtn(String str) {
    return Container(
      height: 35,
      alignment: Alignment.topLeft,
      // padding: EdgeInsets.symmetric(horizontal:),
      child: TextButton(
          onPressed: () {},
          child: Text(
            str,
            style: TextStyle(
                color: Colors.green[600],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal),
          )),
    );
  }

  Widget _text(String str, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Text(
        str,
        textAlign: TextAlign.end,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.green,
        ),
      ),
    );
  }

  int _indexOfSelectedScreen = 2;
  void _selectedTap(int index) {
    setState(() {
      _indexOfSelectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screensList = [
      {'page': QrCodeScreen(), 'title': 'الكود الشخصى'},
      {
        'page': ChatPage(
          chatModel: ChatModel(),
        ),
        'title': '4الكود الشخصى'
      },
      {'page': homeScreen(), 'title': '3الكود الشخصى'},
      {'page': QrCodeScreen(), 'title': '4الكود الشخصى'},
      {'page': WalletScreen(), 'title': 'محفظتى'},
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          index: 2,
          backgroundColor: Colors.white,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Colors.green[900],
          items: const <Widget>[
            Icon(Icons.settings, size: 30),
            Icon(Icons.help_outline_rounded, size: 30),
            Icon(Icons.home, size: 35),
            Icon(Icons.qr_code, size: 30),
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 30,
            ),
          ],
          onTap: (index) {
            _selectedTap(index);
          },
        ),
        body: screensList[_indexOfSelectedScreen]['page'] as Widget,
      ),
    );
  }
}
