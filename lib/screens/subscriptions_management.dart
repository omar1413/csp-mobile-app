import 'package:csp_mobile_app/models/vechile.dart';
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
  @override
  void initState() {
    intl2.initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    intl.Intl.defaultLocale = "ar";
    late final intl.DateFormat formatter = intl.DateFormat('yyyy/MM/dd');
    ;

    final vechile = ModalRoute.of(context)!.settings.arguments as Vechile;
    final sub = vechile.subscriptions;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "اداراة الاشتراكات ", context: context),
        body: ListView.builder(
          itemCount: vechile.subscriptions.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                title: Text(sub[index].packageName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text("حروف اللوحه : " + vechile.paletChars),
                        SizedBox(width: 10),
                        Text("ارقام اللوحه : " + vechile.paletNumbers),
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
                  backgroundImage: AssetImage("assets/images/car.png"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
