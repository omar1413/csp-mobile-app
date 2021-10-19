import 'package:csp_mobile_app/api/transaction_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/founder.dart';

import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_icon.dart';
import 'package:csp_mobile_app/widets/custom_radio_tile.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/fancy_card.dart';
import '../api/rechargr_api.dart';
import 'package:flutter/material.dart';

import '../models/transaction_data.dart';

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
  int amount = 0;
  int? founderId;
  Founder founder = new Founder(id: 0);

  _recharge() async {
    print("founderId:  " +
        founderId.toString() +
        " amount: " +
        amount.toString());
    founder.id = founderId;
    print(founder.id.toString());
    final transaction = Transaction(amount: amount, founder: founder);

    final response = await RechargeAPI.saveRechargeTransaction(transaction);
  }

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
                                      if (amount > 10) {
                                        amount -= 10;
                                      }
                                    });
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(amount.toStringAsFixed(2) + " ",
                                        FontWeight.normal, Colors.white, 26),
                                    CustomText("ج/م", FontWeight.normal,
                                        Colors.white, 18),
                                  ],
                                ),
                                CustomIcon(
                                  icon: Icons.add,
                                  color: kwhite,
                                  onPress: () {
                                    setState(() {
                                      amount += 10;
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
                        _radioTile<int>(
                            text: " فودافون كاش",
                            value: 2,
                            groupValue: founderId,
                            iconPath: "assets/images/vodafone.png",
                            onChanged: (int? selected) {
                              setState(() {
                                founderId = selected;
                              });
                            }),
                        _radioTile<int>(
                            text: " فيزا",
                            value: 3,
                            groupValue: founderId,
                            iconPath: "assets/images/miza.png",
                            onChanged: (int? selected) {
                              setState(() {
                                founderId = selected;
                              });
                            }),
                        _radioTile<int>(
                            text: " فورى",
                            value: 1,
                            groupValue: founderId,
                            iconPath: "assets/images/fawry.png",
                            onChanged: (int? selected) {
                              setState(() {
                                founderId = selected;
                              });
                            }),
                      ],
                    ),
                    /* _textField("رقم كارت الائتمان", context),
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
                    ),*/
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          _recharge();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Theme.of(context).primaryColor,
                        height: 50,
                        child: Text(
                          "تأكيد الدفع",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
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
          margin: EdgeInsets.all(5),
          width: 30,
          child: Tab(
            icon: Image.asset(iconPath),
          ),
        ),
        onChanged: onChanged);
  }
}
