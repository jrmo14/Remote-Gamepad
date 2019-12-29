import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remote_joystick/elements/gamepad.dart';

class ControllerRoute extends StatefulWidget {
  @override
  _ControllerRouteState createState() => new _ControllerRouteState();
}

class _ControllerRouteState extends State<ControllerRoute> {
  _ControllerRouteState() {}

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
    return Scaffold(
      body: Container(
        padding: new EdgeInsets.all(20.0),
        child: Align(
            alignment: Alignment(0, 1),
            child: FractionallySizedBox(heightFactor: .80, child: Gamepad())),
      ),
    );
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
