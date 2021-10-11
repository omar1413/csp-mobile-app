import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/widets/custom_alert_dialog.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart' as intl2;

class Subscriptionsmanagement extends StatefulWidget {
  static const routeName = '/subscriptionsmanagementScreen';
  final Vehicle? vehicle;
  Subscriptionsmanagement({Key? key, this.vehicle}) : super(key: key);

  @override
  _SubscriptionsmanagementState createState() =>
      _SubscriptionsmanagementState();
}

class _SubscriptionsmanagementState extends State<Subscriptionsmanagement> {
  bool rendered = false;

  static const _pageSize = 10;
  final PagingController<int, Subscription> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    intl2.initializeDateFormatting();
    intl.Intl.defaultLocale = "ar";
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<Subscription> newItems;
      if (widget.vehicle != null) {
        newItems = await SubscriptionApi.getVehicleSubscriptions(
          vehicleId: widget.vehicle!.id,
          pageNo: pageKey,
          pageSize: _pageSize,
        );
      } else {
        newItems = await SubscriptionApi.getAllSubscriptions(
          pageNo: pageKey,
          pageSize: _pageSize,
        );
      }
      rendered = true;
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

  @override
  Widget build(BuildContext context) {
    late final intl.DateFormat formatter = intl.DateFormat('yyyy/MM/dd');
    ;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "اداراة الاشتراكات ", context: context),
        body: PagedListView<int, Subscription>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Subscription>(
            noItemsFoundIndicatorBuilder: (ctx) {
              return Container();
            },
            itemBuilder: (context, item, index) => SubscriptionListItem(
              subscription: item,
            ),
          ),
        ),
        floatingActionButton: widget.vehicle != null
            ? FloatingActionButton(
                onPressed: () async {
                  if (rendered) {
                    await Navigator.pushNamed(
                        context, SubscriptionDataScreen.routeName,
                        arguments: Subscription(vechile: widget.vehicle));

                    _pagingController.refresh();
                  }
                },
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }

  Future<List<Subscription>> _subFuture(int? vehicleId) {
    if (vehicleId == null) {
      return Future.value([]);
    } else {
      return SubscriptionApi.getVehicleSubscriptions(vehicleId: vehicleId);
    }
  }

  void _showError(context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showMyDialog(
        context: context,
        title: "خطأ",
        desc: "حدث خطأ اثناء استرجاع البيانات",
      );
      Navigator.pop(context);
    });
  }
}

class SubscriptionListItem extends StatelessWidget {
  final Subscription subscription;

  const SubscriptionListItem({Key? key, required this.subscription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    intl.DateFormat formatter = intl.DateFormat('yyyy/MM/dd');
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            SubscriptionDataScreen.routeName,
            arguments: subscription,
          );
        },
        title: Text(subscription.bundle!.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text("حروف اللوحه : " + subscription.vechile!.plateLetters!),
                SizedBox(width: 10),
                Text("ارقام اللوحه : " + subscription.vechile!.plateNumbers!),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Text(
                  "تاريخ بدايه الاشتراك : ",
                ),
                Expanded(
                  child: Text(
                    formatter.format(subscription.startDate!),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "تاريخ نهايه الاشتراك : ",
                ),
                Expanded(
                  child: Text(
                    formatter.format(subscription.endDate!),
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
