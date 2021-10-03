import 'package:flutter/material.dart';

class ClickableWidget extends StatefulWidget {
  final Widget child;
  final MapEntry data;
  final Function(MapEntry)? onTap;

  const ClickableWidget({
    Key? key,
    required this.child,
    this.data = const MapEntry("", ""),
    this.onTap = null,
  }) : super(key: key);

  @override
  _ClickableWidgetState createState() => _ClickableWidgetState();
}

class _ClickableWidgetState extends State<ClickableWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: widget.child,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(widget.data);
        }
      },
    );
  }
}
