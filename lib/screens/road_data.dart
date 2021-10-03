// ignore_for_file: file_names

import 'package:csp_mobile_app/widets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class RoadData extends StatefulWidget {
  const RoadData({Key? key}) : super(key: key);
  static const routeName = '/roudDataScreen';

  @override
  State<RoadData> createState() => _RoadDataState();
}

class _RoadDataState extends State<RoadData> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String dropdownValue = 'اختر الطريق';
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("بيانات الطرق "),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            height: 50,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.green[900]),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'اختر الطريق',
                'طريق مصر السويس',
                "طريق صلاح سالم",
                'الطريق الصحراوى',
                'Four'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
