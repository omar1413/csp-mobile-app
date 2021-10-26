import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String str;
  final TextEditingController? controller;
  final bool readOnly;
  final Function()? onTap;
  final TextAlign textAlign;
  final bool error;
  final TextInputType? keyboardType;
  final bool digitsOnly;
  final Function(String)? onChanged;
  final bool isPassword;

  CustomTextField(
      {required this.str,
      this.controller,
      this.readOnly = false,
      this.onTap,
      this.textAlign = TextAlign.end,
      this.error = false,
      this.keyboardType,
      this.digitsOnly = false,
      this.onChanged,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        onTap: onTap,
        obscureText: isPassword,
        enableSuggestions: false,
        autocorrect: false,
        readOnly: readOnly,
        controller: controller,
        inputFormatters: digitsOnly
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
            : null,
        textAlign: textAlign,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: error ? Colors.red : Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: error ? Colors.red : kgrey),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          labelText: str,
        ),
      ),
    );
  }
}
