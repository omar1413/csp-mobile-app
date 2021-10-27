import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/api/registration_api.dart';
import 'package:csp_mobile_app/exception/validation_exception.dart';
import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/account_type_lkp.dart';
import 'package:csp_mobile_app/models/company.dart';
import 'package:csp_mobile_app/models/person.dart';
import 'package:csp_mobile_app/widets/custom_radio_tile.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/messages.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class RegisterContinueScreen extends StatefulWidget {
  static const routeName = '/registrationcountinueScreen';
  @override
  _RegisterContinueScreenState createState() => _RegisterContinueScreenState();
}

class _RegisterContinueScreenState extends State<RegisterContinueScreen> {
  Account? account;
  Person? person;
  Company? company;
  AccountType? accountTypelkp;
  AccountType? selectedAccountType;
  /*List < Map<String ,TextEditingController>> controlls=[
    {
      "accountNumber" :TextEditingController(),
    },{
       "namecontroll" : TextEditingController(),
    },
    {
       "phoneControll" : TextEditingController(),
    },
    {
       "nationalNumberControll" : TextEditingController(),
    },
    {
       "passportNumberControll" : TextEditingController(),
    },
    {
       "commercialRegister" : TextEditingController(),
    }
  ];
  */
  bool _showProgressIndicator = false;

  TextEditingController namecontroll = TextEditingController();
  TextEditingController phoneControll = TextEditingController();
  TextEditingController nationalNumberControll = TextEditingController();
  TextEditingController passportNumberControll = TextEditingController();
  TextEditingController commercialRegisterControll = TextEditingController();

  final Map<String, int> accountType = {
    "person": 0,
    "company": 1,
  };
  final Map<String, int> isForeigner = {
    "egyptien": 0,
    "foreigner": 1,
  };
  AccountType accountTypeGroup = AccountType();
  String? isForeignerType = "اجنبى";
//  String dropdownValue = "";
  void initState() {
    super.initState();
    //dropdownValue = accountType[1]!;
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
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          labelText: str,
        ),
      ),
    );
  }

  List<AccountType> accountTypes = [
    AccountType(id: 1, desc: "فرد", code: "PERSON_ACCOUNT"),
    AccountType(id: 2, desc: "شركة", code: "COMPANY_ACCOUNT"),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                CustomTextLine(text: "نوع الحساب"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // _accountTypeRadioTile(
                    //     text: accountTypes[0].desc.toString(),
                    //     value: accountTypes[0].code.toString()),
                    // _accountTypeRadioTile(
                    //     text: accountTypes[1].desc.toString(),
                    //     value: accountTypes[1].code.toString()),

                    _accountTypeRadioTile(accountTypes[0]),
                    _accountTypeRadioTile(accountTypes[1]),
                  ],
                ),
                accountTypeGroup == accountTypes[0]
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _textField("الاسم الرباعى ", context, namecontroll),
                          _textField(
                              "رقم الهاتف المحمول", context, phoneControll),
                          CustomTextLine(text: "جنسية الحساب "),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _isForeignerRadioTile(value: "0", text: "مصرى"),
                              _isForeignerRadioTile(value: "1", text: "اجنبى"),
                            ],
                          ),
                          isForeignerType == "0"
                              ? _textField("الرقم القومى", context,
                                  nationalNumberControll)
                              : Container(),
                          isForeignerType == "1"
                              ? _textField("رقم جواز السفر", context,
                                  passportNumberControll)
                              : Container(),
                        ],
                      )
                    : Container(),
                accountTypeGroup == accountTypes[1]
                    ? Column(
                        children: [
                          _textField("اسم الشركه", context, namecontroll),
                          _textField("رقم هاتف الشركه", context, phoneControll),
                          _textField("السجل التجارى", context,
                              commercialRegisterControll),
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
                    onPressed: () {
                      _registerationContinue(context);
                    },
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

  Widget _accountTypeRadioTile(AccountType accountType) {
    return CustomRadioTile<AccountType>(
        groupValue: accountTypeGroup,
        text: Text(
          accountType.desc ?? "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        onChanged: (AccountType? v) {
          setState(() {
            accountTypeGroup = v ?? AccountType();
            selectedAccountType = accountTypeGroup;
          });
        },
        value: accountType);
  }

  Widget _isForeignerRadioTile({required String value, required String text}) {
    return CustomRadioTile(
        groupValue: isForeignerType,
        text: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        onChanged: (String? v) {
          setState(() {
            isForeignerType = v ?? "";
          });
        },
        value: value);
  }

  _registerationContinue(BuildContext ctx) async {
    try {
      validate();
      showProgressIndicator();
      final person = Person(
          mobileNumber: phoneControll.value.text,
          name: namecontroll.value.text,
          nationalNumber: nationalNumberControll.value.text,
          passportNumber: passportNumberControll.value.text);
      final company = Company(
          mobileNumber: phoneControll.value.text,
          name: namecontroll.value.text,
          commercialRegister: commercialRegisterControll.value.text);
      //final accountType = AccountType(code: selectedAccountType);
      final account = Account(
        person: person,
        company: company,
        accountType: selectedAccountType,
        isForeigner: isForeignerType == "0" ? false : true,
      );
      final response = await RegistrationApi.saveContinueRegistration(account);
      print("status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        Navigator.of(ctx).pushReplacementNamed(MainScreen.routeName);
        successMessage(ctx, "تم استكمال بيانات الحساب");
      } else
        errorMessage(ctx, "بيانات غير صحيحه");
    } catch (error) {
      errorMessage(ctx, BaseApi.handleError(error));
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

  void validate() {
    if (selectedAccountType == null) {
      throw ValidationException("من فضلك اختر نوع الحساب ");
    }
    if (namecontroll.value.text.isEmpty || phoneControll.value.text.isEmpty) {
      throw ValidationException("من فضلك اكمل البيانات");
    }
    if (selectedAccountType!.id == 1) {
      if (passportNumberControll.value.text.isEmpty &&
          nationalNumberControll.value.text.isEmpty) {
        throw ValidationException("من فضلك اكمل البيانات");
      }
      if (selectedAccountType!.id == 2) {
        if (commercialRegisterControll.value.text.isEmpty) {
          throw ValidationException("من فضلك اكمل البيانات");
        }
      }
    }
  }
}
