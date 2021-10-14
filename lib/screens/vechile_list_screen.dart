import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/api/vehicle_api.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/subscriptions_management_data_arg.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/screens/subscriptions_management_screen.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VechileListScreen extends StatefulWidget {
  static const routeName = 'VechileListScreen';
  VechileListScreen({Key? key}) : super(key: key);

  @override
  _VechileListScreentState createState() => _VechileListScreentState();
}

class _VechileListScreentState extends State<VechileListScreen> {
  static const _pageSize = 10;
  final PagingController<int, Vehicle> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await VehicleApi.getVehicles(
          vehicelPage: pageKey, vehicelPageSize: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //appBar: customAppBar(title: "المركبات", context: context),
        body: PagedListView<int, Vehicle>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Vehicle>(
            itemBuilder: (context, item, index) => VehicleListItem(
              vehicle: item,
            ),
          ),
        ),
      ),
    );
  }
}

class VehicleListItem extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleListItem({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            Subscriptionsmanagement.routeName,
            arguments: SubscriptionsmanagementArg(
              vehicle: vehicle,
              getVehicleSubscriptions: SubscriptionApi.getVehicleSubscriptions,
            ),
          );
        },
        title: Text(vehicle.type!.desc),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text("حروف اللوحه : " + vehicle.plateLetters!),
                SizedBox(width: 10),
                Text("ارقام اللوحه : " + vehicle.plateNumbers!),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Text(
                  "رقم الملصق : ",
                ),
                Expanded(
                  child: Text(
                    vehicle.tagValue!,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/car.png"),
        ),
      ),
    );
  }
}
