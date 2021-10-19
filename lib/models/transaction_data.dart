import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/founder.dart';
import 'package:csp_mobile_app/models/transaction_type.dart';

class Transaction {
  int? id;
  int? amount;
  TransactionType? transactionType;
  Founder? founder;
  Account? toAccount;
  DateTime? dateTime;

  Transaction(
      {this.id,
      this.transactionType,
      this.dateTime,
      this.amount,
      this.founder,
      this.toAccount});

  Transaction.fromJson(Map json)
      : id = json["id"],
        amount = json["amount"],
        transactionType = TransactionType.fromJson(json["transactionType"]),
        founder = Founder.fromJson(json["founderType"]),
        toAccount = Account.fromJson(json["toAccount"]),
        dateTime = DateTime.fromMillisecondsSinceEpoch(json["date"]);
  Map toJson() {
    return {
      "id": id,
      "amount": amount,
      "transactionType": transactionType?.toJson(),
      "founderType": founder?.toJson(),
      "toAccount": toAccount?.toJson(),
      "date": dateTime,
    };
  }
}

List<Transaction> transactions = [];
