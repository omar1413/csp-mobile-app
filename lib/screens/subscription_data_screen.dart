import 'package:csp_mobile_app/api/base_api.dart';
import 'package:csp_mobile_app/api/bundle_api.dart';
import 'package:csp_mobile_app/api/subscription_api.dart';
import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/Bundle.dart';
import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/vehicle.dart';
import 'package:csp_mobile_app/widets/bundle_info.dart';
import 'package:csp_mobile_app/widets/custom_alert_dialog.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/custom_button.dart';
import 'package:csp_mobile_app/widets/custom_textfiled.dart';
import 'package:csp_mobile_app/widets/messages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SubscriptionDataScreen extends StatefulWidget {
  static const routeName = 'SubscriptionDataScreen';
  final Subscription subscription;
  final bool readOnly;
  const SubscriptionDataScreen(
      {Key? key, required this.subscription, this.readOnly = true})
      : super(key: key);

  @override
  _SubscriptionDataScreenState createState() => _SubscriptionDataScreenState();
}

class Item {
  const Item(this.id, this.name);
  final String name;
  final int id;
}

class _SubscriptionDataScreenState extends State<SubscriptionDataScreen> {
  List<Bundle> users = [
    Bundle(name: 'اسم الباقه', id: -1),
  ];

  late List<DropdownMenuItem<Bundle>> items;

  late Bundle selectedValue;

  TextEditingController dateinput = TextEditingController();

  TextEditingController periodInput = TextEditingController();
  TextEditingController paidAmountInput = TextEditingController();

  DateTime? pickedDate;

  bool dateInputError = false;

  bool periodInputError = false;
  bool paidAmountInputError = false;
  bool bundleError = false;

  bool isSubmiting = false;

  Map? dataArgs;

  bool readOnly = true;

  void initBundleLkp() async {
    try {
      _showProgress();
      List<Bundle> bundles = await BundleApi.bundleLkp();

      setState(() {
        print(bundles[0].name);
        users.addAll(bundles);
        initItems();
      });
    } catch (e) {
      print(e);
    }

    _hideProgress();
  }

  initItems() {
    selectedValue = users[0];
    if (widget.subscription.id != null) {
      Subscription sub = widget.subscription;
      selectedValue = sub.bundle!;
      users.clear();
      users.add(selectedValue);
      String dateFormat = "yyyy/MM/dd";
      dateinput.text = intl.DateFormat(dateFormat).format(sub.startDate!);
      pickedDate = sub.startDate;
      if (readOnly) {
        periodInput.text = sub.subscriptionPeriod.toString();
        paidAmountInput.text = sub.paidAmount.toString();
      } else {
        dateinput.text = intl.DateFormat(dateFormat).format(sub.endDate!);
        pickedDate = sub.endDate;
      }
    }
    items = users.map((Bundle user) {
      return DropdownMenuItem<Bundle>(
        value: user,
        child: Text(
          user.name,
          style: TextStyle(color: kblack),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    readOnly = widget.readOnly;
    if (widget.subscription.id == null) {
      readOnly = false;
    }
    initBundleLkp();
    initItems();

    dateinput.text = ""; //set the initial value of text field

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "الاشتراك", context: context),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Container(
                            //   alignment: Alignment.centerRight,
                            //   child: Text(
                            //     'اسم الباقه',
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w500, fontSize: 16),
                            //   ),
                            // ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 80,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: bundleError
                                                ? Colors.red
                                                : kgrey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: double.infinity,
                                    height: kMidHeight,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        icon: widget.subscription.id != null
                                            ? Icon(null)
                                            : null,
                                        value: selectedValue,
                                        items: items,
                                        onChanged:
                                            widget.subscription.id != null
                                                ? null
                                                : (Bundle? value) {
                                                    setState(() {
                                                      selectedValue = value!;
                                                    });
                                                  },
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 20,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                        onTap: () {
                                          showBundleinfo(selectedValue);
                                        },
                                        child: Icon(Icons.info)),
                                  ),
                                ),
                              ],
                            ),
                            CustomTextField(
                              str: "تاريخ بدايه الباقه",
                              onChanged: (_) {
                                _calculatePaidAmount();
                              },
                              controller: dateinput,
                              error: dateInputError,
                              readOnly: true,
                              onTap: readOnly ? null : showPicker,
                              textAlign: TextAlign.center,
                            ),
                            CustomTextField(
                              readOnly: readOnly,
                              onChanged: (_) {
                                _calculatePaidAmount();
                              },
                              controller: periodInput,
                              error: periodInputError,
                              keyboardType: TextInputType.number,
                              str: "مدة الاشتراك بالشهور",
                              textAlign: TextAlign.center,
                            ),
                            CustomTextField(
                              controller: paidAmountInput,
                              str: "المدفوع",
                              readOnly: true,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: CustomButton(
                        text: widget.subscription.id == null
                            ? "اشتراك"
                            : readOnly
                                ? "اضغط للتجديد"
                                : "تجديد الاشتراك",
                        onPress: () {
                          _saveSub(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isSubmiting
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color.fromARGB(1, 1, 1, 1),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  showPicker() async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime
            .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = intl.DateFormat('yyyy-MM-dd').format(pickedDate!);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        dateinput.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  _showProgress() {
    setState(() {
      isSubmiting = true;
    });
  }

  _hideProgress() {
    setState(() {
      isSubmiting = false;
    });
  }

  bool _validate(BuildContext context) {
    bool valide = true;
    bundleError = false;
    dateInputError = false;
    periodInputError = false;
    if (selectedValue.id == -1) {
      setState(() {
        bundleError = true;
      });

      valide = false;
    }
    if (dateinput.value.text.isEmpty) {
      setState(() {
        dateInputError = true;
      });
      valide = false;
    } else if (pickedDate != null &&
        _getDate(pickedDate!).difference(_getDate(DateTime.now())).isNegative) {
      errorMessage(context, "يجب ان يكون التاريخ لا يقل عن تاريخ اليوم");

      return false;
    }
    String period = periodInput.value.text.trim();

    int p = int.tryParse(period) ?? -1;

    if (p == -1) {
      setState(() {
        periodInputError = true;
      });

      periodInput.clear();
      valide = false;
    } else {
      if (p > 12 || p < 1) {
        errorMessage(context, "مدة الاشتراك من 1 شهر الى 12 شهر فقط");

        return false;
      }
    }

    return valide;
  }

  _saveSub(BuildContext context) async {
    _showProgress();
    try {
      if (readOnly) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SubscriptionDataScreen(
              subscription: widget.subscription,
              readOnly: false,
            ),
          ),
        );
        return;
      }
      if (!_validate(context)) {
        _hideProgress();
        return;
      }

      Subscription sub = widget.subscription;
      sub.bundle = selectedValue;
      sub.startDate = pickedDate;
      DateTime date = pickedDate!;

      sub.endDate =
          Jiffy(date).add(months: int.parse(periodInput.value.text)).dateTime;
      sub.subscriptionPeriod = int.parse(periodInput.value.text);
      sub.paidAmount = double.parse(paidAmountInput.value.text);
      if (sub.id == null) {
        await SubscriptionApi.save(subscription: widget.subscription);
        successMessage(context, "تم الاشتراك");
      } else {
        await SubscriptionApi.update(subscription: widget.subscription);
        successMessage(context, "تم التجديد");
      }

      Navigator.pop(context);
    } catch (e) {
      errorMessage(context, BaseApi.handleError(e));
    }

    _hideProgress();
  }

  void _calculatePaidAmount() {
    try {
      int period = int.parse(periodInput.value.text);
      double price = selectedValue.price!;

      double paidAmout = period * price;
      paidAmountInput.text = paidAmout.toString();
    } catch (e) {
      print(e);
    }
  }

  DateTime _getDate(DateTime date) {
    final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');

    final String formattedDate = formatter.format(date);
    final DateTime formatted = formatter.parse(formattedDate);
    return formatted;
  }

  showBundleinfo(Bundle bundle) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            scrollable: true,
            backgroundColor: Colors.transparent,
            content: BundleInfo(
              bundle: bundle,
            ),
          );
        });
  }
}
