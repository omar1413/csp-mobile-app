import 'package:csp_mobile_app/widets/custom_radio_tile.dart';
import 'package:flutter/material.dart';

class RegisterContinueScreen extends StatefulWidget {
  static const routeName = '/registrationcountinueScreen';
  @override
  _RegisterContinueScreenState createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  //final List<String> accountType = ["شركه", "فرد"];
  final Map<int, String> accountType = {
    0: "فرد",
    1: "شركه",
  };
  String? accountTypeGroup = "accountType";
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
                  left: width * 0.60,
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
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _accountTypeRadioTile(value: accountType[0]!, text: "فرد"),
                _accountTypeRadioTile(value: accountType[1]!, text: "شركه"),
              ],
            ),

            _textField("رقم الحساب", context),
            _textField("جنسيه الحساب", context),
            accountTypeGroup == accountType[0]
                ? Column(
                    children: [
                      _textField("الرقم القومى", context),
                      _textField("الاسم الرباعى ", context),
                      _textField("رقم الهاتف المحمول", context),
                    ],
                  )
                : Container(),

            accountTypeGroup == accountType[1]
                ? Column(
                    children: [
                      _textField("السجل التجارى", context),
                      _textField("اسم الشركه", context),
                      _textField("رقم هاتف الشركه", context),
                    ],
                  )
                : Container(),

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
                  "استكمال بيانات الحساب",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ])),
        ));
  }

  Widget _accountTypeRadioTile({required String value, required String text}) {
    return CustomRadioTile(
        groupValue: accountTypeGroup,
        text: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        onChanged: (String? v) {
          setState(() {
            accountTypeGroup = v;
          });
        },
        value: value);
  }
}
