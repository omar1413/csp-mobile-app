import 'package:csp_mobile_app/api/bundle_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/Bundle.dart';
import 'package:csp_mobile_app/models/sector.dart';
import 'package:flutter/material.dart';

class BundleInfo extends StatefulWidget {
  final Bundle bundle;
  const BundleInfo({Key? key, required this.bundle}) : super(key: key);

  @override
  _BundleInfoState createState() => _BundleInfoState();
}

class _BundleInfoState extends State<BundleInfo> {
  List<Sector>? sectors;
  bool isLoading = true;

  initSectors() async {
    sectors = await BundleApi.bundSectors(widget.bundle);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      initSectors();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                FractionallySizedBox(
                    widthFactor: 0.8, child: FittedBox(child: _bundleItem())),
                SizedBox(
                  height: 20,
                ),
                ..._sectors(),
              ],
            ),
          ),
        ),
        isLoading ? Center(child: CircularProgressIndicator()) : Container(),
      ],
    );
  }

  Widget _bundleItem() {
    return Container(
      child: Row(
        children: [
          Image.asset("assets/images/bundle-name.png"),
          SizedBox(width: 4),
          Text(widget.bundle.name),
          SizedBox(width: 4),
          Image.asset("assets/images/money.png"),
          SizedBox(width: 4),
          Text(widget.bundle.price.toString() + " جنيه مصرى "),
          SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _sectorItem(Sector e) {
    return Container(
      width: 800,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kwhite,
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset("assets/images/sector.png")),
          SizedBox(width: 2),
          Expanded(flex: 5, child: FittedBox(child: Text("قطاع : " + e.name))),
          SizedBox(width: 2),
          Expanded(
              flex: 1, child: Image.asset("assets/images/bundle-road.png")),
          SizedBox(width: 2),
          Expanded(flex: 5, child: FittedBox(child: Text(e.road?.name ?? ""))),
        ],
      ),
    );
  }

  List<Widget> _sectors() {
    if (sectors == null) {
      return [];
    }
    return sectors!.map((e) => _sectorItem(e)).toList();
  }
}
