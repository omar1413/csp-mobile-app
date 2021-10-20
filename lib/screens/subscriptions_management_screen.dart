import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/subscriptions_management_data_arg.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/widets/custom_alert_dialog.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/subscription_list_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart' as intl2;

class Subscriptionsmanagement extends StatefulWidget {
  static const routeName = '/subscriptionsmanagementScreen';
  final SubscriptionsmanagementArg args;
  //final Vehicle? vehicle;
  Subscriptionsmanagement({Key? key, required this.args}) : super(key: key);

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
      newItems = await widget.args
          .getSubscription(pageNo: pageKey, pageSize: _pageSize);
      // if (widget.vehicle != null) {
      //   newItems = await SubscriptionApi.getVehicleSubscriptions(
      //     vehicleId: widget.vehicle!.id,
      //     pageNo: pageKey,
      //     pageSize: _pageSize,
      //   );
      // } else {
      //   newItems = await SubscriptionApi.getAllSubscriptions(
      //     pageNo: pageKey,
      //     pageSize: _pageSize,
      //   );
      // }
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
    Vehicle? vehicle = widget.args.vehicle;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: vehicle != null || widget.args.showAppBar
            ? customAppBar(title: "اداراة الاشتراكات ", context: context)
            : null,
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
        floatingActionButton: vehicle != null
            ? FloatingActionButton(
                onPressed: () async {
                  if (rendered) {
                    await Navigator.pushNamed(
                        context, SubscriptionDataScreen.routeName,
                        arguments: Subscription(vechile: vehicle));

                    _pagingController.refresh();
                  }
                },
                child: Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}
