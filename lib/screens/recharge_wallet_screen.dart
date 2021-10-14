import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_icon.dart';
import 'package:csp_mobile_app/widets/custom_radio_tile.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/fancy_card.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:csp_mobile_app/widets/square_item.dart';
import 'package:flutter/material.dart';
import '../widets/transaction_list.dart';
import '../widets/transaction_item.dart';
import '../models/transaction_data.dart';
import '../widets/square_item.dart';

Widget CustomText(String str, FontWeight fw, Color color, double size) {
  return Text(
    str,
    style: TextStyle(fontWeight: fw, color: color, fontSize: size),
  );
}

class RechargeWalletScreen extends StatefulWidget {
  static const String routeName = "RechargeWalletScreen";

  @override
  _RechargeWalletScreenState createState() => _RechargeWalletScreenState();
}

class _RechargeWalletScreenState extends State<RechargeWalletScreen> {
  double priceValue = 0;
  String? _character;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "إعادة الشحن", context: context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextLine(text: "أدخل المبلغ"),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: FancyCard(
                        imagePath: "assets/images/card.png",
                        // color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomText("اسم المستخدم", FontWeight.normal,
                                    Colors.white70, 16),
                                SizedBox(height: 5),
                                CustomText("RFIO 10002248900",
                                    FontWeight.normal, Colors.white70, 14),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(
                                  icon: Icons.remove,
                                  color: kwhite,
                                  onPress: () {
                                    setState(() {
                                      if (priceValue > 0) {
                                        priceValue--;
                                      }
                                    });
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        priceValue.toStringAsFixed(2) + " ",
                                        FontWeight.normal,
                                        Colors.white,
                                        26),
                                    CustomText("ج/م", FontWeight.normal,
                                        Colors.white, 18),
                                  ],
                                ),
                                CustomIcon(
                                  icon: Icons.add,
                                  color: kwhite,
                                  onPress: () {
                                    setState(() {
                                      priceValue++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomTextLine(text: "طريقه الدفع"),
                    Column(
                      children: [
                        _radioTile<String>(
                            text: "بطاقه ائتمانيه",
                            value: "a",
                            groupValue: _character,
                            iconPath: "assets/images/credit-card.png",
                            onChanged: (String? v) {
                              setState(() {
                                _character = v;
                              });
                            }),
                        _radioTile<String>(
                            text: "كارت ميزة",
                            value: "b",
                            groupValue: _character,
                            iconPath: "assets/images/miza.png",
                            onChanged: (String? v) {
                              setState(() {
                                _character = v;
                              });
                            }),
                        _radioTile<String>(
                            text: "فورى",
                            value: "c",
                            groupValue: _character,
                            iconPath: "assets/images/fawry.png",
                            onChanged: (String? v) {
                              setState(() {
                                _character = v;
                              });
                            }),
                      ],
                    ),
                    _textField("رقم كارت الائتمان", context),
                    _textField("اسم كارت الائتمان", context),
                    Row(
                      children: [
                        Expanded(
                          child: _textField("تاريخ الانتهاء", context),
                        ),
                        Expanded(
                          child: _textField("الرقم المتغير", context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                height: 40,
                child: Text(
                  "تأكيد الدفع",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(String lbl, BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: TextField(
        // textDirection:TextDirection.rtl ,

        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: lbl,
          labelStyle: TextStyle(color: Colors.grey),
          //focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }

  Widget _radioTile<T>({
    required String text,
    required String iconPath,
    required T value,
    required T? groupValue,
    required Function(T?) onChanged,
  }) {
    return CustomRadioTile<T>(
        text: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        value: value,
        groupValue: groupValue,
        icon: Container(
          width: 50,
          child: Tab(
            icon: Image.asset(iconPath),
          ),
        ),
        onChanged: onChanged);
  }
}
