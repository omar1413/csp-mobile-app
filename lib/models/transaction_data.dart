import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final String subtitle;
  //final DateTime dateTime;

  Transaction({
    required this.id,
    required this.subtitle,
    required this.title,
    // required this.dateTime
  });
}

final DummyTransactionData = [
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    //  dateTime:DateTime();
  )
];
