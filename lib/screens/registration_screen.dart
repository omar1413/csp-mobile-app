import 'package:csp_mobile_app/api/Registration_api.dart';
import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/models/registration.dart';
import 'package:csp_mobile_app/models/user_customer.dart';
import 'package:csp_mobile_app/screens/login_screen.dart';
import 'package:csp_mobile_app/screens/registration_continue_screen.dart';
import 'package:csp_mobile_app/widets/messages.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _showProgressIndicator = false;
  TextEditingController usernameControll = TextEditingController();
  TextEditingController passcontroll = TextEditingController();
  TextEditingController emailControll = TextEditingController();
  TextEditingController passConficontroll = TextEditingController();
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
                child: Image.asset('assets/images/login.png', fit: BoxFit.fill),
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
                        "انشاء حساب جديد",
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
                    child:
                        Image.asset('assets/images/logo.png', fit: BoxFit.fill),
                  ))
            ],
          ),
          SizedBox(
            height: height * 0.06,
          ),
          _textField("اسم المستخدم", context, usernameControll),
          _textField("البريد الالكترونى ", context, emailControll),
          _textField("كلمة المرور", context, passcontroll),
          _textField("تأكيد كلمة المرور", context, passConficontroll),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            width: width * 0.6,
            child: FlatButton(
              onPressed: () {
                _registeration();
                Navigator.of(context)
                    .pushReplacementNamed(RegisterContinueScreen.routeName);
              },
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
      ),
    );
  }

  _registeration() async {
    try {
      showProgressIndicator();
      if (passcontroll.value.text != passConficontroll.value.text)
        errorMessage(context, "اعد كتابة كلمة المرور ");
      else {
        final userCustomer = UserCustomer(
          emailControll.value.text,
          passcontroll.value.text,
          true,
        );
        final registration = Registration(
          userCustomer,
          usernameControll.value.text,
        );
        final response = await RegistrationApi.saveUser(registration);
        print("status code : ${response.statusCode}");
        if (response.statusCode == 200)
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        else
          errorMessage(context, "بيانات غير صحيحه");
      }
    } catch (error) {
      print(error);
      errorMessage(context, BaseApi.handleError(error));
    } finally {
      hideProgressIndicator();
    }
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
}
