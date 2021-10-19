import 'dart:math';

import 'package:csp_mobile_app/models/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_data.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionIteam extends StatelessWidget {
  Transaction transaction;
  TransactionIteam({
    required this.transaction,
  });

  String _text(Transaction transaction) {
    if (transaction.transactionType!.code.toString() == "RECHARGE")
      return "عن طريق " + transaction.founder!.desc.toString();
    if (transaction.transactionType!.code.toString() == "TRANSFER")
      return "لحساب رقم " + transaction.toAccount!.id.toString();
    else
      return "";
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Intl.defaultLocale = "ar_SU";
    var format = DateFormat();

    return Card(
      elevation: 3,
      child: Container(
          height: 55,
          padding: EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 20,
                margin: EdgeInsets.all(10),
                child: Icon(
                  Icons.monetization_on_sharp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "تم " +
                          transaction.transactionType!.desc.toString() +
                          "بقيمة " +
                          transaction.amount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          _text(transaction),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.green[900],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          format.format(transaction.dateTime!),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.green[900],
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Container(
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.green[900],
                    ),
                    onPressed: () {} /*selectedTransaction(transaction.id)*/)),
          ])),
    );
  }
}
