import 'package:csp_mobile_app/models/account.dart';

import 'founder.dart';

class Transfer {
  int amount;
  Account account;

  Transfer(this.amount, this.account);

  Map toJson() => {
        "amount": amount,
        "founderType": account.toJson(),
      };
}
