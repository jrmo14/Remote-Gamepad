import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_joystick/debug_border.dart';

import 'circle.dart';

typedef JoystickCallback = void Function(double x, double y);

class Joystick extends StatelessWidget {
  final double diameter;
  final double innerScaleFac;
  final Color fgColor;
  final Color bgColor;
  final Color innerColor;
  final double opacity;
  final JoystickCallback joystickCallback;

  Joystick({
    this.diameter,
    this.innerScaleFac = 4,
    this.opacity,
    this.joystickCallback,
    this.fgColor = Colors.white54,
    this.bgColor = Colors.blueGrey,
    this.innerColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double realRadius =
        diameter != null ? diameter : min(size.width, size.height) / 2;
    double innerRadius = realRadius / innerScaleFac;
    Offset lastPos = Offset(realRadius / 2, realRadius / 2);
    Offset innerPos =
        _calculateInnerPos(lastPos, innerRadius, diameter, Offset(0, 0));
    debugPrint("[WIDGET INFO] real radius is $realRadius");
    debugPrint("[WIDGET INFO] innerRadius is $innerRadius");
    debugPrint(
        "[WIDGET INFO] joystick range should be 0 - ${realRadius - innerRadius}");
    return Center(child: StatefulBuilder(builder: (context, setState) {
      Widget joystick = Stack(
        children: <Widget>[
          Circle.joystickCircle(realRadius, bgColor),
          Positioned(
            child: Circle.joystickInnerCircle(innerRadius, innerColor),
            top: innerPos.dy,
            left: innerPos.dx,
          )
        ],
      );
      return GestureDetector(
        onPanStart: (details) {
          _doCallback(diameter, details.localPosition);
          setState(() => lastPos = details.localPosition);
        },
        onPanEnd: (details) {
          Offset centerPt = Offset(realRadius / 2, realRadius / 2);
          if (joystickCallback != null) joystickCallback(0, 0);
          innerPos =
              _calculateInnerPos(centerPt, innerRadius, diameter, Offset(0, 0));
          setState(() => lastPos = centerPt);
        },
        onPanUpdate: (details) {
          innerPos = _calculateInnerPos(
              lastPos, innerRadius, diameter, details.localPosition);
          _doCallback(realRadius - innerRadius, innerPos);
          setState(() => lastPos = details.localPosition);
        },
        child: (opacity != null)
            ? Opacity(opacity: opacity, child: joystick)
            : joystick,
      );
    }));
  }

  void _doCallback(double joystickDiameter, Offset offset) {
    if (joystickCallback != null) {
      Offset remapped = Offset(map(offset.dx, 0, joystickDiameter, -1, 1),
          map(offset.dy, 0, joystickDiameter, -1, 1));
      joystickCallback(remapped.dx, remapped.dy);
    }
  }

  Offset _calculateInnerPos(
      Offset lastPos, double innerDia, double diameter, Offset offset) {
    final radius = diameter / 2.0;
    final radiusInner = innerDia / 2;

    final angle = atan2(offset.dy - radius, offset.dx - radius);
    final degrees = (offset.dx < radius && offset.dy < radius)
        ? (angle * 180 / pi) + 360
        : (angle * 180 / pi);

    final isStartPosition = lastPos.dx == innerDia && lastPos.dy == innerDia;
    final lastAngleRadians = (isStartPosition) ? 0 : (degrees) * (pi / 180.0);

    final radiusDelta = radius - radiusInner;

    final x = (lastAngleRadians == -1)
        ? radiusDelta
        : (radiusDelta) + (radiusDelta) * cos(lastAngleRadians);
    final y = (lastAngleRadians == -1)
        ? radiusDelta
        : (radiusDelta) + (radiusDelta) * sin(lastAngleRadians);

    var xPosition = lastPos.dx - radiusInner;
    var yPosition = lastPos.dy - radiusInner;

    if (lastAngleRadians < 0) {
      if (xPosition > x) xPosition = x;
      if (yPosition < y) yPosition = y;
    } else if (lastAngleRadians < pi / 2) {
      if (xPosition > x) xPosition = x;
      if (yPosition > y) yPosition = y;
    } else if (lastAngleRadians < pi) {
      if (xPosition < x) xPosition = x;
      if (yPosition > y) yPosition = y;
    } else {
      if (xPosition < x) xPosition = x;
      if (yPosition < y) yPosition = y;
    }

    return Offset(xPosition, yPosition);
  }

  double map(
      double x, double inLow, double inMax, double toLow, double toHigh) {
    return (x - inLow) * (toHigh - toLow) / (inMax - inLow) + toLow;
  }
}
