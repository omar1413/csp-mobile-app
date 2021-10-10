import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/widets/custom_alert_dialog.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart' as intl2;

class Subscriptionsmanagement extends StatefulWidget {
  static const routeName = '/subscriptionsmanagementScreen';
  Subscriptionsmanagement({Key? key}) : super(key: key);

  @override
  _SubscriptionsmanagementState createState() =>
      _SubscriptionsmanagementState();
}

class _SubscriptionsmanagementState extends State<Subscriptionsmanagement> {
  bool rendered = false;
  @override
  void initState() {
    intl2.initializeDateFormatting();
    intl.Intl.defaultLocale = "ar";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late final intl.DateFormat formatter = intl.DateFormat('yyyy/MM/dd');
    ;

    final vechileId = ModalRoute.of(context)!.settings.arguments as int?;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "اداراة الاشتراكات ", context: context),
        body: FutureBuilder(
          future: _subFuture(vechileId),
          builder: (ctx, AsyncSnapshot<List<Subscription>> snap) {
            if (snap.hasError) {
              _showError(context);
              return Container();
            }
            if (!snap.hasData && snap.data == null) {
              return Center(child: CircularProgressIndicator());
            }

            final sub = snap.data!;

            rendered = true;

            return Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: sub.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: ListTile(
                            title: Text(sub[index].bundle.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Text("حروف اللوحه : " +
                                        sub[index].vechile.plateLetters),
                                    SizedBox(width: 10),
                                    Text("ارقام اللوحه : " +
                                        sub[index].vechile.plateNumbers),
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
                                        formatter.format(sub[index].startDate),
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
                                        formatter.format(sub[index].endDate),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/car.png"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (rendered) {
              Navigator.pushNamed(context, SubscriptionDataScreen.routeName);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Future<List<Subscription>> _subFuture(int? vehicleId) {
    if (vehicleId == null) {
      return Future.value();
    } else {
      return SubscriptionApi.getVehicleSubscriptions(vehicleId: vehicleId);
    }
  }

  void _showError(context) async {
    await showMyDialog(
      context: context,
      title: "خطأ",
      desc: "حدث خطأ ما اثناء تسجيل الدخول",
    );
  }
}
