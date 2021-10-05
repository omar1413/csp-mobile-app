import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPress;
  const CustomButton({Key? key, required this.text, on, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Colors.green[600],
      height: 40,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
    );
  }
}
