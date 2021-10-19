import 'package:csp_mobile_app/models/transaction_data.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionListScreen extends StatelessWidget {
  static const routeName = '/TransactionListScreen';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "تاريخ المعاملات", context: context),
        body: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: TransactionList()),
      ),
    );
  }
}
