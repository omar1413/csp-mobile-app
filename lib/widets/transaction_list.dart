import 'package:flutter/material.dart';
import '../models/transaction_data.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  @override
  final List<Transaction> _transactionList;
  TransactionList(this._transactionList);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return TransactionIteam(
          transaction: _transactionList[index],
        );
      },
      itemCount: _transactionList.length,
    );
  }
}
