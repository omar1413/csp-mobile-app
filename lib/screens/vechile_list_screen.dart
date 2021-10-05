import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vechile.dart';
import 'package:csp_mobile_app/screens/subscriptions_management.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:flutter/material.dart';

class VechileListScreen extends StatefulWidget {
  static const routeName = 'VechileListScreen';
  VechileListScreen({Key? key}) : super(key: key);

  @override
  _VechileListScreentState createState() => _VechileListScreentState();
}

class _VechileListScreentState extends State<VechileListScreen> {
  List<Vechile> vechiles = [];

  @override
  void initState() {
    vechiles.add(Vechile(
      1,
      "ملاكى",
      "abc",
      "123",
      "ffsdf3",
    ));
    vechiles.add(Vechile(
      1,
      "ملاكى",
      "abc",
      "123",
      "ffsdf3",
    ));
    vechiles.add(Vechile(
      1,
      "ملاكى",
      "abc",
      "123",
      "ffsdf3",
    ));
    vechiles.add(Vechile(
      1,
      "ملاكى",
      "abc",
      "123",
      "ffsdf3",
    ));
    vechiles.add(Vechile(
      1,
      "ملاكى",
      "abc",
      "123",
      "ffsdsssssssssssssssssssssssssf3",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "المركبات", context: context),
        body: ListView.builder(
          itemCount: vechiles.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Subscriptionsmanagement.routeName,
                    arguments: vechiles[index].id,
                  );
                },
                title: Text(vechiles[index].type),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text("حروف اللوحه : " + vechiles[index].paletChars),
                        SizedBox(width: 10),
                        Text("ارقام اللوحه : " + vechiles[index].paletNumbers),
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
                            vechiles[index].tagId,
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
