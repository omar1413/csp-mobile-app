import 'package:csp_mobile_app/api/vehicle_api.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "المركبات", context: context),
        body: FutureBuilder(
            future: VehicleApi.getVehicles(),
            builder: (ctx, AsyncSnapshot<List<Vehicle>> sn) {
              if (!sn.hasData || sn.data == null) {
                return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator()));
              }
              final vechiles = sn.data!;
              return ListView.builder(
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
                      title: Text(vechiles[index].type.desc),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text("حروف اللوحه : " +
                                  vechiles[index].plateLetters),
                              SizedBox(width: 10),
                              Text("ارقام اللوحه : " +
                                  vechiles[index].plateNumbers),
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
                                  vechiles[index].tagValue,
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
              );
            }),
      ),
    );
  }
}
