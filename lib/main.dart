import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:remote_joystick/controller_route.dart';
import 'package:remote_joystick/touchpad.dart';

void main() => runApp(RemoteControlApp());

class RemoteControlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("App init");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open controller"),
          onPressed: onPressed,
        ),
      ),
    );
  }

  void onPressed() {
    print("Opening controller");
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ControllerRoute())
    );
  }
}
