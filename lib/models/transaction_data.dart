import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final String subtitle;
  final DateTime dateTime;

  Transaction(
      {required this.id,
      required this.subtitle,
      required this.title,
      required this.dateTime});
}

final DummyTransactionData = [
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "أ ك م /576 ",
    subtitle: "طريق صلاح سالم ",
    dateTime: DateTime.utc(2000, DateTime.february, 3),
  ),
  Transaction(
    id: "1",
    title: "ط م ن /728 ",
    subtitle: "طريق مصر الصحراوى",
    dateTime: DateTime.utc(2012, DateTime.april, 15),
  ),
  Transaction(
    id: "1",
    title: "د م ث /423 ",
    subtitle: "طريق الزراعى ",
    dateTime: DateTime.utc(2021, DateTime.january, 16),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "أ ك م /576 ",
    subtitle: "طريق صلاح سالم ",
    dateTime: DateTime.utc(2000, DateTime.february, 3),
  ),
  Transaction(
    id: "1",
    title: "ط م ن /728 ",
    subtitle: "طريق مصر الصحراوى",
    dateTime: DateTime.utc(2012, DateTime.april, 15),
  ),
  Transaction(
    id: "1",
    title: "د م ث /423 ",
    subtitle: "طريق الزراعى ",
    dateTime: DateTime.utc(2021, DateTime.january, 16),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
  Transaction(
    id: "1",
    title: "د م ن /423 ",
    subtitle: "طريق مصر السويس",
    dateTime: DateTime.utc(1989, DateTime.november, 9),
  ),
];
