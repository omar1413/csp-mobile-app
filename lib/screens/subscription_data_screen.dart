import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_button.dart';
import 'package:csp_mobile_app/widets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class SubscriptionDataScreen extends StatefulWidget {
  static const routeName = 'SubscriptionDataScreen';
  const SubscriptionDataScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionDataScreenState createState() => _SubscriptionDataScreenState();
}

class Item {
  const Item(this.name);
  final String name;
}

class _SubscriptionDataScreenState extends State<SubscriptionDataScreen> {
  List<Item> users = [
    const Item('اسم الباقه'),
    const Item('اختر باقه'),
    const Item('ReactNative'),
    const Item('iOS'),
  ];

  late List<DropdownMenuItem<Item>> items;

  late Item selectedValue;

  @override
  void initState() {
    items = users.map((Item user) {
      return DropdownMenuItem<Item>(
        value: user,
        child: Text(
          user.name,
          style: TextStyle(color: kblack),
        ),
      );
    }).toList();
    selectedValue = users[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "الاشتراك", context: context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 20,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'اسم الباقه',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 80,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: kgrey),
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: kMidHeight,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selectedValue,
                              items: items,
                              onChanged: (Item? value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(str: "تاريخ بدايه الباقه"),
                  CustomTextField(str: "صلاحيه الاشتراك بالشهور"),
                  CustomTextField(str: "المدفوع"),
                ],
              ),
              CustomButton(
                text: "s",
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
