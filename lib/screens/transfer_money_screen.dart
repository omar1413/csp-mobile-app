import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/api/transfer_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/exception/validation_exception.dart';
import 'package:csp_mobile_app/models/account.dart';
import 'package:csp_mobile_app/models/founder.dart';
import 'package:csp_mobile_app/screens/home_screen.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_icon.dart';
import 'package:csp_mobile_app/widets/custom_radio_tile.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/fancy_card.dart';
import 'package:csp_mobile_app/widets/messages.dart';
import 'package:csp_mobile_app/widets/service.dart';
import 'package:csp_mobile_app/widets/square_item.dart';
import 'package:flutter/material.dart';
import '../widets/transaction_list.dart';
import '../widets/transaction_item.dart';
import '../models/transaction_data.dart';
import '../widets/square_item.dart';

Widget CustomText(String str, FontWeight fw, Color color, double size) {
  return Text(
    str,
    style: TextStyle(fontWeight: fw, color: color, fontSize: size),
  );
}

class TransferMoenyScreen extends StatefulWidget {
  static const String routeName = "TransferMoenyScreen";

  @override
  _TransferMoneyScreenState createState() => _TransferMoneyScreenState();
}

class _TransferMoneyScreenState extends State<TransferMoenyScreen> {
  int amount = 0;
  TextEditingController numberControll = TextEditingController();
  TextEditingController yearControll = TextEditingController();
  TextEditingController typeControll = TextEditingController();

  _transfer(BuildContext ctx) async {
    try {
      validate();

      final account = await TransferApi.gitAccountByAccNumber(
          int.parse(numberControll.value.text),
          int.parse(yearControll.value.text),
          int.parse(typeControll.value.text));

      final transaction = Transaction(amount: amount, toAccount: account);
      final response = await TransferApi.saveTransferTransaction(transaction);
      successMessage(ctx, "تم التحويل بنجاح ");
      Navigator.pop(ctx);
    } on ValidationException catch (e) {
      errorMessage(ctx, e.msg);
    } catch (e) {
      //errorMessage(ctx, "فشل التحويل");
      errorMessage(ctx, BaseApi.handleError(e));
    }
  }

  Account account = new Account(id: 0); ////////graby t4ely de
  @override
  build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "تحويل رصيد", context: context),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),

                        /* CustomRadioTile(
                          groupValue: accountId,
                          onChanged: (selected) {
                            setState(() {
                              //accountId = selected;
                            });
                          },
                          value: "a",
                          text: Text("رقم الحساب"),
                        ),*/
                        CustomTextLine(text: "ادخل رقم الحساب"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _textField("الرقم", context, numberControll),
                              _textField("السنة", context, yearControll),
                              _textField("النوع", context, typeControll)
                            ],
                          ),
                        ),

                        // CustomRadioTile(
                        //   groupValue: _character,
                        //   onChanged: (String? v) {
                        //     setState(() {
                        //       _character = v;
                        //     });
                        //   },
                        //   value: "b",
                        //   text: Text("Qr Code"),
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       width: 1,
                        //       color: kgrey,
                        //     ),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   padding: EdgeInsets.all(20),
                        //   margin: EdgeInsets.symmetric(horizontal: 15),
                        //   child: Image.asset("assets/images/shadow-large-par-code.png"),
                        // ),
                        CustomTextLine(text: "ادخل المبلغ"),
                        Container(
                          height: 110,
                          margin: EdgeInsets.all(15),
                          child: FancyCard(
                            imagePath: "assets/images/blue-card.png",
                            // color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 30,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: CustomText(
                                              "",
                                              FontWeight.normal,
                                              Colors.white70,
                                              16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 75,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomIcon(
                                        icon: Icons.remove,
                                        color: kwhite,
                                        onPress: () {
                                          setState(() {
                                            if (amount > 0) {
                                              amount--;
                                            }
                                          });
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              amount.toStringAsFixed(2) + " ",
                                              FontWeight.normal,
                                              Colors.white,
                                              26),
                                          CustomText("ج/م", FontWeight.normal,
                                              Colors.white, 18),
                                        ],
                                      ),
                                      CustomIcon(
                                        icon: Icons.add,
                                        color: kwhite,
                                        onPress: () {
                                          setState(() {
                                            amount += 10;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  _transfer(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                height: 40,
                child: Text(
                  "تأكيد التحويل",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(
      String lbl, BuildContext context, TextEditingController controller) {
    return Container(
      height: 40,
      width: 100,
      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: TextField(
        controller: controller,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: lbl,
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }

  Widget _radioTile<T>({
    required String text,
    required String iconPath,
    required T value,
    required T? groupValue,
    required Function(T?) onChanged,
  }) {
    return CustomRadioTile<T>(
        text: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        value: value,
        groupValue: groupValue,
        icon: Container(
          width: 50,
          child: Tab(
            icon: Image.asset(iconPath),
          ),
        ),
        onChanged: onChanged);
  }

  void validate() {
    if (numberControll.value.text.isEmpty ||
        yearControll.value.text.isEmpty ||
        typeControll.value.text.isEmpty) {
      throw const ValidationException("  رقم الحساب غير صحيح");
    }
    if (amount < 50) {
      throw const ValidationException("يجب ان لا بقل المبلغ عن 50 جنيها ");
    }
  }

  getAccount(BuildContext ctx) async {
    try {} on ValidationException catch (e) {
      errorMessage(ctx, BaseApi.handleError(e));
      //errorMessage(ctx, e.msg);
    } catch (e) {
      errorMessage(ctx, BaseApi.handleError(e));
      //errorMessage(ctx, "رقم  حساب غير صحيح");
    }
  }
}
