import 'package:flutter/material.dart';

class SubscripeItem extends StatelessWidget {
  double value;
  SubscripeItem({required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.75),
              Colors.green,
            ],
            begin: Alignment.centerLeft,
          ),
        ),
        height: 60,
        width: value,
      ),
    );
  }
}
