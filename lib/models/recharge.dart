import 'founder.dart';

class Recharge {
  int amount;
  Founder founder;

  Recharge(this.amount, this.founder);

  Map toJson() => {
        "amount": amount,
        "founderType": founder.toJson(),
      };
}
