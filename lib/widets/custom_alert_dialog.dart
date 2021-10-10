import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> showMyDialog({
  context,
  required String title,
  required String desc,
}) async {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc: desc,
    buttons: [
      // DialogButton(
      //   child: Text(
      //     "COOL",
      //     style: TextStyle(color: Colors.white, fontSize: 20),
      //   ),
      //   onPressed: () => Navigator.pop(context),
      //   width: 120,
      // ),
    ],
  ).show();
}
