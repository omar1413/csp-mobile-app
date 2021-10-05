import 'package:csp_mobile_app/models/subscription.dart';
import 'dart:async';

import 'package:csp_mobile_app/models/vechile.dart';

class SubscriptionApi {
  static Future<List<Subscription>> findAll({int? id}) {
    Vechile vechile = Vechile(1, "type", "abc", "123", "tagId");
    Subscription sub =
        Subscription("شبرا بنها", DateTime.now(), DateTime.now(), vechile);
    if (id != null) {
      return Future.delayed(Duration(seconds: 1), () {
        return [
          sub,
          sub,
          sub,
        ];
      });
    }
    return Future.value([
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
      sub,
    ]);
  }
}
