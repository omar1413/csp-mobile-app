import 'package:csp_mobile_app/models/vechile.dart';

class Subscription {
  String packageName;
  DateTime startDate;
  DateTime endDate;
  Vechile vechile;

  Subscription(
    this.packageName,
    this.startDate,
    this.endDate,
    this.vechile,
  );
}
