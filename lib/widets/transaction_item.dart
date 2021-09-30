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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transaction.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      format.format(transaction.dateTime),
                      // DateFormat().format(transaction.dateTime),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed:
                            () {} /*selectedTransaction(transaction.id)*/)),
              ])),
    );
  }
}
