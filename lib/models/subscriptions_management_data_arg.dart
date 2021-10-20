import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';

class SubscriptionsmanagementArg {
  final Vehicle? vehicle;
  final Future<List<Subscription>> Function({
    required int vehicleId,
    int pageNo,
    int pageSize,
  })? getVehicleSubscriptions;

  final bool showAppBar;

  final Future<List<Subscription>> Function({
    int pageNo,
    int pageSize,
  })? getAllSubscriptions;

  SubscriptionsmanagementArg(
      {this.vehicle,
      this.getVehicleSubscriptions,
      this.getAllSubscriptions,
      this.showAppBar = false});

  Future<List<Subscription>> getSubscription({
    int pageNo = 0,
    int pageSize = 10,
  }) async {
    if (getVehicleSubscriptions != null) {
      return getVehicleSubscriptions!(
          vehicleId: vehicle!.id, pageNo: pageNo, pageSize: pageSize);
    } else if (getAllSubscriptions != null) {
      return getAllSubscriptions!(pageNo: pageNo, pageSize: pageSize);
    }
    return Future.error(Exception());
  }
}
