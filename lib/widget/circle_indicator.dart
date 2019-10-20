import 'package:flutter/material.dart';
import 'package:messaging_app/config/palette.dart';

class CircleIndicator extends StatefulWidget {
  bool isActive;

  CircleIndicator(this.isActive);

  @override
  _CircleIndicatorState createState() => new _CircleIndicatorState();
}

class _CircleIndicatorState extends State<CircleIndicator> {
  // TODO: add state variables and methods

  @override
  Widget build(BuildContext context) {
    // TODO: add widget build method
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: widget.isActive ? 12 : 8,
      width: widget.isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: widget.isActive ? Palette.primaryColor : Palette.secondaryTextColorLight,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
