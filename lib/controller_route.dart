import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'touchpad.dart';

class ControllerRoute extends StatefulWidget {
  @override
  _ControllerRouteState createState() => new _ControllerRouteState();
}

class _ControllerRouteState extends State<ControllerRoute> {
  _ControllerRouteState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void onChanged(Offset offset) {}

  @override
  Widget build(BuildContext context) {
//    Paint paint_a =
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Touchpad(
                onChanged: onChanged,
                name: "Left touchpad",
                paint: new Paint()
                  ..color = Colors.red[400]
                  ..style = PaintingStyle.fill),
          ),
          new Expanded(
            flex: 2,
            child: new Touchpad(
                onChanged: onChanged,
                name: "Right touchpad",
                paint: new Paint()
                  ..color = Colors.blue[400]
                  ..style = PaintingStyle.fill),
          )
        ],
      ),
    );
  }
}
