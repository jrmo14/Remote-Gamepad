import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double diameter;
  final Color color;
  final List<BoxShadow> boxShadow;
  final Border border;
  final double opacity;
  final Text buttonText;

  Circle(
      {this.diameter,
      this.color = Colors.transparent,
      this.boxShadow,
      this.border,
      this.opacity,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      child: Center(
        child: (buttonText != null) ? buttonText : null,
      ),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
    );
  }

  factory Circle.joystickCircle(double diameter, Color color) => Circle(
        diameter: diameter,
        color: color,
        border: Border.all(
            color: Colors.black45, width: 4.0, style: BorderStyle.solid),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );

  factory Circle.joystickInnerCircle(double diameter, Color color) => Circle(
        diameter: diameter,
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );

  factory Circle.padBGCircle(
          double diameter, Color bgColor, borderColor, Color shadowColor,
          {double opacity}) =>
      Circle(
        diameter: diameter,
        color: bgColor,
        opacity: opacity,
        border: Border.all(
          color: borderColor,
          width: 4.0,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          ),
        ],
      );

  factory Circle.padButtonCircle(double diameter, Color color, Text text) =>
      Circle(
        diameter: diameter,
        color: color,
        buttonText: (text != null) ? text : Text(""),
        border: Border.all(
            color: Colors.black26, width: 2.0, style: BorderStyle.solid),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );
}
