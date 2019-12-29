import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:remote_joystick/controller_route.dart';

void main() => runApp(RemoteControlApp());

class RemoteControlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Building App main page state");
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: "Remote Controller"),
        routes: <String, WidgetBuilder>{
          '/controller': (BuildContext context) => new ControllerRoute(),
        });
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState(title: title);
}

class _HomePageState extends State<HomePage> {
  String title;

  _HomePageState({this.title}) : super() {
    print("Creating state");
    print("Title is $title");
    if (this.title == null) {
      this.title = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Open controller"),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  void onPressed() {
    print("Opening controller");
    Navigator.of(context).pushNamed('/controller');
  }
}
