import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'circle.dart';

typedef ButtonCallback = void Function(bool pressed);

class GamepadButton extends StatelessWidget {
  final double diameter;
  final Color color;
  final double opacity;
  final Text text;
  final ButtonCallback buttonCallback;

  GamepadButton({
    Key key,
    this.diameter,
    this.color = Colors.red,
    this.opacity,
    this.buttonCallback,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = InkWell(child: Circle.buttonCircle(diameter, color, text));
    return GestureDetector(
      child:
          (opacity != null) ? Opacity(opacity: opacity, child: button) : button,
      onPanStart: (details) {
        if (buttonCallback != null) {
          buttonCallback(true);
        }
      },
      onPanEnd: (details) {
        if (buttonCallback != null) {
          buttonCallback(false);
        }
      },
    );
  }
}
