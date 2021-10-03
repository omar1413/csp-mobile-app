import 'package:csp_mobile_app/models/subscription.dart';

class Vechile {
  String type;
  String paletChars;
  String paletNumbers;
  String tagId;
  List<Subscription> subscriptions;

  Vechile(this.type, this.paletChars, this.paletNumbers, this.tagId,
      this.subscriptions);
}
