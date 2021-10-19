import 'package:csp_mobile_app/models/transaction_type.dart';
import 'package:csp_mobile_app/screens/recharge_wallet_screen.dart';
import 'package:csp_mobile_app/screens/transaction_list_screen.dart';
import 'package:csp_mobile_app/screens/transfer_money_screen.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_textButton.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/fancy_card.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:csp_mobile_app/widets/transaction_item.dart';
import 'package:flutter/material.dart';

import '../widets/transaction_list.dart';
import '../models/transaction_data.dart';

Widget CustomText(String str, FontWeight fw, Color color, double size) {
  return Text(
    str,
    style: TextStyle(fontWeight: fw, color: color, fontSize: size),
  );
}

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    TransactionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "محفظتى", context: context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 25,
              ),
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
                          CustomText("RFIO 10002248900", FontWeight.normal,
                              Colors.white70, 14),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  "140 ", FontWeight.normal, Colors.white, 26),
                              CustomText(
                                  "ج/م", FontWeight.normal, Colors.white, 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomTextLine(text: "ادارة المحفظة"),
              Row(
                children: [
                  Service(
                    id: "4",
                    title: "اعادة الشحن",
                    image: "assets/images/wallet-relaod.png",
                    onPress: () {
                      Navigator.pushNamed(
                          context, RechargeWalletScreen.routeName);
                    },
                  ),
                  Service(
                    id: "5",
                    title: " تحويل رصيد",
                    image: "assets/images/payment-transfer.png",
                    onPress: () {
                      Navigator.pushNamed(
                          context, TransferMoenyScreen.routeName);
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextLine(text: "تاريخ المعاملات"),
                    CustomTextButton(
                        str: "عرض الكل",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TransactionListScreen.routeName);
                        },
                        size: 16,
                        color: Colors.green,
                        td: TextDecoration.none)
                  ],
                ),
              ),
              TransactionList(
                legnth: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
