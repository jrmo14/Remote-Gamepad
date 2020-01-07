import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_joystick/elements/gamepad.dart';
import 'package:remote_joystick/gamepad_client.dart';

class ControllerRoute extends StatefulWidget {
  final String host;
  final int port;

  ControllerRoute({Key key, this.host = "192.168.1.18", this.port = 50051})
      : super(key: key);

  @override
  _ControllerRouteState createState() =>
      new _ControllerRouteState(host: host, port: port);
}

class _ControllerRouteState extends State<ControllerRoute> {
  final String host;
  final int port;

  _ControllerRouteState({this.host, this.port}) {
    debugPrint("Building state");
  }

  void _debugCallback(
      Offset leftOffset, Offset rightOffset, List<bool> buttons) {
    debugPrint(
        "GAMEPAD STATE:\n\tleft ${leftOffset.dx}:${leftOffset.dy} :: right ${rightOffset.dx}:${rightOffset.dy}\n\tButtons:\n\t\tA: ${buttons[0]}\n\t\tB: ${buttons[1]}\n\t\tX: ${buttons[2]}\n\t\tY: ${buttons[3]}");
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  // TODO implement
  void onChanged(Offset offset) {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        body: Container(
          padding: new EdgeInsets.all(20.0),
          child: Align(
              alignment: Alignment(0, 1),
              child: FractionallySizedBox(
                  heightFactor: .80,
                  child: Gamepad(
//                  gamepadCallback: _debugCallback,
                    gamepadCallback: GamepadClientImpl().gamepadCallback,
                  ))),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    return Future.value(GamepadClientImpl().disconnect());
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
}
