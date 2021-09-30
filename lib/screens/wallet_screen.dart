import 'package:csp_mobile_app/widets/custom_text.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(),
            CustomText(text: "ادارة المحفظة"),
            Row(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "تاريخ المعاملات"),
                Text("عرض الكل",
                    style: TextStyle(
                        fontSize: 8, color: Theme.of(context).primaryColor))
              ],
            ),
            Container(
                //child: TransactionList(_transactionList, _deleteTransaction),
                ),
          ],
        ),
      ),
    );
  }
}
