import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'circle.dart';

typedef ButtonCallback = void Function(bool pressed);

class GamepadButton extends StatefulWidget {
  final double diameter;
  final Color color;
  final double opacity;
  final Text text;
  final ButtonCallback buttonCallback;

  GamepadButton(
      {Key key,
      this.diameter,
      this.color = Colors.red,
      this.opacity,
      this.buttonCallback,
      this.text});

  @override
  _GamepadButtonState createState() => _GamepadButtonState();
}

class _GamepadButtonState extends State<GamepadButton> {
  @override
  Widget build(BuildContext context) {
    Widget button =
        InkWell(child: Circle.padButtonCircle(widget.diameter, widget.color, widget.text));
    return GestureDetector(
      child:
          (widget.opacity != null) ? Opacity(opacity: widget.opacity, child: button) : button,
      onPanStart: (details) {
        if (widget.buttonCallback != null) {
          widget.buttonCallback(true);
        }
      },
      onPanEnd: (details) {
        if (widget.buttonCallback != null) {
          widget.buttonCallback(false);
        }
      },
    );
  }
}
