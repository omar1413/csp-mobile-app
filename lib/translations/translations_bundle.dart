import 'package:easy_localization/easy_localization.dart';

String translate(String? msg) {
  String? transalatedMsg = "";

  transalatedMsg = msg?.tr();

  if (msg == transalatedMsg || transalatedMsg == null) {
    transalatedMsg = "GENERAL_ERROR".tr();
  }

  return transalatedMsg;
}
