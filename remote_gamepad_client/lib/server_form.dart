import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:remote_joystick/gamepad_client.dart';

class ServerForm extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  ServerForm(this.scaffoldKey);

  @override
  State<StatefulWidget> createState() => ServerFormState(scaffoldKey);
}

class ServerFormState extends State<ServerForm> {
  final _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey;
  String host;
  int port;

  ServerFormState(this._scaffoldKey);

  bool _numOnly(String s) {
    for (var c in s.codeUnits) {
      if (c < "0".codeUnitAt(0) || c > "9".codeUnitAt(0)) return false;
    }
    return true;
  }

  String _validateIP(String val) {
//    if (val == null) return "YEET";
//    var split = val.split('.');
//    if (split.length != 4) return "Not a valid IP, wrong number of segments";
//    for (var seg in split) {
//      if (seg.length > 3 || !_numOnly(seg)) return "Not a valid IP";
//    }
    return null;
  }

  String _validatePort(String val) {
    if (val == null) return "YEET";
    if (!_numOnly(val) || val.isEmpty) return "Not a valid port (not a number)";
    if (int.parse(val) < 0 || int.parse(val) > 65535)
      return "Not a valid port (out of range)";
    return null;
  }

  Future<void> _submitForm() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showMessage("Form not valid, please correct");
    } else {
      form.save();
      bool connectionStatus =
          await GamepadClientImpl().connect(host: host, port: port);
      debugPrint("Connection attempt returned $connectionStatus");
      if (connectionStatus) {
        debugPrint("Connection valid");
        Navigator.of(context).pushNamed("/controller");
      } else
        showMessage("Unable to connect to server");
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidate: false,
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration:
                  InputDecoration(hintText: "0.0.0.0", labelText: "Server ip"),
//              keyboardType: TextInputType.number,
              validator: _validateIP,
              onSaved: (val) => host = val,
              inputFormatters: <TextInputFormatter>[
//                LengthLimitingTextInputFormatter(15),
                WhitelistingTextInputFormatter(RegExp("\d|[a-z]|[A-Z]|\.")),
                BlacklistingTextInputFormatter.singleLineFormatter
              ],
            ),
            TextFormField(
              decoration:
                  InputDecoration(hintText: "0000", labelText: "Server port"),
              keyboardType: TextInputType.number,
              validator: _validatePort,
              onSaved: (val) => port = int.parse(val),
              inputFormatters: <TextInputFormatter>[],
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text("Connect controller"),
                onPressed: _submitForm,
              ),
            ),
          ],
        ));
  }
}
