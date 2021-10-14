import 'package:csp_mobile_app/api/auth_api.dart';
import 'package:csp_mobile_app/models/User.dart';
import 'package:csp_mobile_app/screens/main_screen.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/screens/registration_screen.dart';
import 'package:csp_mobile_app/widets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:hospital_application/Widget/Animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget _text(String str) {
  return Text(
    str,
    textAlign: TextAlign.end,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Colors.white,
    ),
  );
}

Widget _textField(
    String str, BuildContext context, TextEditingController controller) {
  return Container(
    height: 40,
    width: 300,
    margin: EdgeInsets.only(bottom: 10),
    child: TextField(
      controller: controller,
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

Widget _textBtn(String str, Function onPressed) {
  return Container(
    height: 35,
    alignment: Alignment.topLeft,
    // padding: EdgeInsets.symmetric(horizontal:),
    child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          str,
          style: TextStyle(
              color: Colors.green[600],
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.normal),
        )),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showProgressIndicator = false;
  TextEditingController usernameControll = TextEditingController();
  TextEditingController passcontroll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image.asset('assets/images/login.png',
                            fit: BoxFit.fill),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: width * 0.6,
                        top: height * 0.35,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _text("تسجيل دخول المستخدم "),
                              Container(
                                height: 4,
                                width: 60,
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
                  Container(
                    margin: EdgeInsets.all(10),
                    width: width * 0.9,
                    child: Column(
                      children: [
                        _textField("اسم المستخدم", context, usernameControll),
                        _textField("كلمة المرور ", context, passcontroll),
                        // _textBtn("هل نسيت كلمة المرور؟ ", () {}),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: Colors.white,
                                width: width * 0.6,
                                child: FlatButton(
                                  onPressed: _login,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  color: Theme.of(context).primaryColor,
                                  height: 40,
                                  child: Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   icon: const Icon(
                              //     Icons.fingerprint,
                              //     color: Colors.green,
                              //   ),
                              //   //color:Colors.,
                              //   onPressed: () {},
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _textBtn("هل انت مستخدم جديد؟", () {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.routeName);
                              }),
                              _textBtn("انشاء حساب جديد  ", () {}),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   color: Colors.white,
                        //   width: width * 0.65,
                        //   child: RaisedButton(
                        //     onPressed: () {},
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(50.0)),
                        //     color: Colors.white,
                        //     child: Text(
                        //       "الدخول كزائر",
                        //       style: TextStyle(
                        //           color: Colors.green[600], fontSize: 14.0),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _circularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  showProgressIndicator() {
    setState(() {
      _showProgressIndicator = true;
    });
  }

  hideProgressIndicator() {
    setState(() {
      _showProgressIndicator = false;
    });
  }

  _circularProgressIndicator() {
    if (_showProgressIndicator) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(120, 150, 150, 150),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container();
    }
  }

  _login() async {
    showProgressIndicator();
    try {
      final user = User(
        usernameControll.value.text,
        passcontroll.value.text,
      );
      final response = await AuthApi.login(user);

      print("status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        AuthApi.saveToken(response.body);
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      } else {
        showMyDialog(
          context: context,
          title: "خطأ",
          desc: "حدث خطأ ما اثناء تسجيل الدخول",
        );
      }
    } catch (error) {
      print(error);
      showMyDialog(
        context: context,
        title: "خطأ",
        desc: "حدث خطأ ما اثناء تسجيل الدخول",
      );
    } finally {
      hideProgressIndicator();
    }
  }
}
