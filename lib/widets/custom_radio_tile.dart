import 'package:flutter/material.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T? groupValue;
  final T value;
  final Function(T?) onChanged;
  final Widget? icon;
  final Text text;
  const CustomRadioTile({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.value,
    this.icon,
    this.text = const Text(""),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(
          activeColor: Theme.of(context).primaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        icon != null ? icon! : Container(),
        text,
      ],
    );
  }
}
