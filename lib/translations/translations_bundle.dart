import 'package:easy_localization/easy_localization.dart';

String translate(String? msg) {
  String? transalatedMsg = "";

  transalatedMsg = msg?.tr();

  if (msg != null && transalatedMsg == msg) {
    String newMsg = "errors." + msg;
    transalatedMsg = newMsg.tr();
    if (transalatedMsg == newMsg) {
      transalatedMsg = msg;
    }
  }

  if (transalatedMsg == null) {
    transalatedMsg = "GENERAL_ERROR".tr();
  }

  return transalatedMsg;
}
