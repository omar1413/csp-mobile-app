import 'package:flutter/material.dart';

class RegisterContinueScreen extends StatefulWidget {
  static const routeName = '/registrationScreen';
  @override
  _RegisterContinueScreenState createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  //final List<String> accountType = ["شركه", "فرد"];
  final Map<int, String> accountType = {
    1: "فرد",
    2: "شركه",
  };
  String dropdownValue = "";
  void initState() {
    super.initState();
    dropdownValue = accountType[1]!;
  }

  Widget _textField(String str, BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        // textDirection:TextDirection.rtl ,
        textAlign: TextAlign.end,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          //focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          labelText: str,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(children: [
            Stack(
              children: [
                Container(
                  child:
                      Image.asset('assets/images/login.png', fit: BoxFit.fill),
                  height: height * 0.4,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: width * 0.68,
                  top: height * 0.35,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "استكمال بيانات الحساب",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ]),
                ),
                Positioned(
                    left: width * 0.34,
                    top: height * 0.14,
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/logo.png',
                          fit: BoxFit.fill),
                    ))
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            DropdownButtonHideUnderline(
              child: Container(
                height: 40,
                width: 300,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: accountType.entries
                      .map<DropdownMenuItem<String>>((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.value,
                      child: Text(entry.value),
                    );
                  }).toList(),
                ),
              ),
            ),
            _textField("اسم المستخدم", context),
            _textField("الرقم القومى ", context),
            _textField("كلمة المرور", context),
            _textField("تأكيد كلمة المرور", context),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              width: width * 0.6,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Colors.green[600],
                height: 40,
                child: Text(
                  "انشاء حساب",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ])),
        ));
  }
}
