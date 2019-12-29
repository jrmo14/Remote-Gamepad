import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'joystick.dart';
import 'button.dart';

typedef GamepadCallback = Function(
    Offset leftStick, Offset rightStick, List<bool> buttonStates);

class Gamepad extends StatefulWidget {
  @override
  _GamepadState createState() => _GamepadState();
}

class _GamepadState extends State<Gamepad> {
  final buttonDiameter = 60.0;

  final joystickDiameter = 150.0;

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle =
        TextStyle(fontSize: buttonDiameter / 2.5, color: Colors.white);

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Align(
                  child: GamepadButton(
                    diameter: buttonDiameter,
                    color: Colors.yellow,
                    text: Text("Y", style: buttonTextStyle),
                    buttonCallback: null,
                  ),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  child: Joystick(
                    diameter: joystickDiameter,
                    joystickCallback: null,
                  ),
                  alignment: Alignment.bottomLeft,
                ),
                Align(
                    child: GamepadButton(
                      diameter: buttonDiameter,
                      color: Colors.blue,
                      text: Text("X", style: buttonTextStyle),
                      buttonCallback: null,
                    ),
                    alignment: Alignment.centerRight)
              ],
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Align(
                  child: GamepadButton(
                    diameter: buttonDiameter,
                    color: Colors.red,
                    text: Text("B", style: buttonTextStyle),
                    buttonCallback: null,
                  ),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  child: Joystick(
                    diameter: joystickDiameter,
                    joystickCallback: null,
                  ),
                  alignment: Alignment.bottomRight,
                ),
                Align(
                    child: GamepadButton(
                      diameter: buttonDiameter,
                      color: Colors.green,
                      text: Text("A", style: buttonTextStyle),
                      buttonCallback: null,
                    ),
                    alignment: Alignment.centerLeft)
              ],
            ),
          )
        ],
      ),
    );
  }
}
