import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remote_joystick/debug_border.dart';

import 'joystick.dart';
import 'button.dart';

typedef GamepadCallback = Function(
    Offset leftStick, Offset rightStick, List<bool> buttonStates);

class Gamepad extends StatefulWidget {
  final buttonDiameter;
  final joystickDiameter;
  final GamepadCallback gamepadCallback;

  const Gamepad(
      {Key key,
      this.buttonDiameter,
      this.joystickDiameter,
      this.gamepadCallback})
      : super(key: key);

  @override
  _GamepadState createState() => _GamepadState(
      joystickDiameter: joystickDiameter,
      buttonDiameter: buttonDiameter,
      gamepadCallback: gamepadCallback);
}

class _GamepadState extends State<Gamepad> {
  final double buttonDiameter;

  final double joystickDiameter;
  final GamepadCallback gamepadCallback;
  Offset _leftStick;
  Offset _rightStick;

  var _buttonStates = new List<bool>(4);

  _GamepadState(
      {this.gamepadCallback,
      this.buttonDiameter = 60.0,
      this.joystickDiameter = 150.0});

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle =
        TextStyle(fontSize: buttonDiameter / 2.5, color: Colors.white);

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GamepadButton(
                        diameter: buttonDiameter,
                        color: Colors.yellow,
                        text: Text("Y", style: buttonTextStyle),
                        buttonCallback: (buttonState) {
                          _buttonStates[3] = buttonState;
                          if (gamepadCallback != null) {
                            gamepadCallback(
                                _leftStick, _rightStick, _buttonStates);
                          }
                        },
                      ),
                      Joystick(
                        diameter: joystickDiameter,
                        joystickCallback: (x, y) {
                          _leftStick = Offset(x, y);
                          if (gamepadCallback != null) {
                            gamepadCallback(
                                _leftStick, _rightStick, _buttonStates);
                          }
                        },
                      ),
                    ],
                  ),
                  GamepadButton(
                    diameter: buttonDiameter,
                    color: Colors.blue,
                    text: Text("X", style: buttonTextStyle),
                    buttonCallback: (buttonState) {
                      _buttonStates[2] = buttonState;
                      if (gamepadCallback != null) {
                        gamepadCallback(_leftStick, _rightStick, _buttonStates);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GamepadButton(
                  diameter: buttonDiameter,
                  color: Colors.red,
                  text: Text("B", style: buttonTextStyle),
                  buttonCallback: (buttonState) {
                    _buttonStates[1] = buttonState;
                    if (gamepadCallback != null) {
                      gamepadCallback(_leftStick, _rightStick, _buttonStates);
                    }
                  },
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GamepadButton(
                        diameter: buttonDiameter,
                        color: Colors.green,
                        text: Text("A", style: buttonTextStyle),
                        buttonCallback: (buttonState) {
                          _buttonStates[0] = buttonState;
                          if (gamepadCallback != null) {
                            gamepadCallback(
                                _leftStick, _rightStick, _buttonStates);
                          }
                        },
                      ),
                      Joystick(
                        diameter: joystickDiameter,
                        joystickCallback: (x, y) {
                          _rightStick = Offset(x, y);
                          if (gamepadCallback != null) {
                            gamepadCallback(
                                _leftStick, _rightStick, _buttonStates);
                          }
                        },
                      ),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
