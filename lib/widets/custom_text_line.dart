import 'package:flutter/material.dart';

class CustomTextLine extends StatelessWidget {
  final String text;

  CustomTextLine({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF43A047),
            ),
          ),
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}
