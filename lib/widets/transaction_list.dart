import 'package:csp_mobile_app/api/transaction_api.dart';

import 'package:flutter/material.dart';
import '../models/transaction_data.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  int? legnth;
  TransactionList({this.legnth});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: FutureBuilder<List<Transaction>>(
        future: getAllTransaction(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          transactions = snapshot.data!.reversed.toList();
          if (snapshot.data!.length < 3 || legnth != 3) {
            legnth = snapshot.data!.length;
          }

          return ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionIteam(
                transaction: snapshot.data![index],
              );
            },
            itemCount: legnth,
          );
        },
      ),
    );
  }
}
