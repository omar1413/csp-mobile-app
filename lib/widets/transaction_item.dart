import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_data.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransactionIteam extends StatelessWidget {
  Transaction transaction;
  TransactionIteam({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    Intl.defaultLocale = "ar_SU";
    var format = DateFormat();

    //var dateString = format.format(DateTime.now());
    return Card(
      elevation: 3,
      child: Container(
          padding: EdgeInsets.all(5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Container(
              height: 20,
              margin: EdgeInsets.all(10),
              child: Image.asset("assets/images/car.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                Container(
                  width: 160,
                  height: 20,
                  child: Text(
                    transaction.subtitle +
                        "  " +
                        format.format(transaction.dateTime),
                    // DateFormat().format(transaction.dateTime),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.green[900],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 55,
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
