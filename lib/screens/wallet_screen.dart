import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:csp_mobile_app/widets/square_slider_item.dart';
import 'package:flutter/material.dart';
import '../widets/transaction_list.dart';
import '../widets/transaction_item.dart';
import '../models/transaction_data.dart';
import '../widets/square_slider_item.dart';

Widget CustomText(String str, FontWeight fw, Color color, double size) {
  return Text(
    str,
    style: TextStyle(fontWeight: fw, color: color, fontSize: size),
  );
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "محفظتى", context: context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Stack(children: [
                Container(
                  height: height * 0.22,
                  width: width * 0.88,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  child: Image.asset("assets/images/card.png"),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: CustomText(
                      "اسم المستخدم", FontWeight.normal, Colors.white70, 16),
                ),
                Positioned(
                  top: 45,
                  right: 10,
                  child: CustomText("RFIO 10002248900", FontWeight.normal,
                      Colors.white70, 14),
                ),
                Positioned(
                  top: 110,
                  right: 100,
                  child: CustomText("140", FontWeight.normal, Colors.white, 26),
                ),
                Positioned(
                  top: 120,
                  right: 150,
                  child: CustomText("ج/م", FontWeight.normal, Colors.white, 14),
                ),
              ]),
            ),
            CustomTextLine(text: "ادارة المحفظة"),
            Row(
              children: [
                Service(
                    id: "4",
                    title: "اعادة الشحن",
                    image: "assets/images/wallet-relaod.png"),
                Service(
                    id: "5",
                    title: " تحويل رصيد",
                    image: "assets/images/payment-transfer.png")
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextLine(text: "تاريخ المعاملات"),
                  Text(
                    "عرض الكل",
                    style: TextStyle(
                        fontSize: 10, color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: height * 0.22,
                child: TransactionList(DummyTransactionData)),
            /*Container(
              color: Colors.red,
              child: TransactionIteam(
                transaction: Transaction(
                  id: "1",
                  title: "د م ن /423 ",
                  subtitle: "طريق مصر السويس",
                  dateTime: DateTime.utc(1989, DateTime.november, 9),
                ),
              ),
            ),
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionIteam(
                      transaction: DummyTransactionData[index]);
                },
                itemCount: DummyTransactionData.length,
              ),*/
          ],
        ),
      ),
    );
  }
}
