import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remote_joystick/controller_route.dart';
import 'package:remote_joystick/server_form.dart';

void main() => runApp(RemoteControlApp());

class RemoteControlApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint("Building App main page state");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  _HomePageState({this.title}) : super() {
    debugPrint("Creating state");
    debugPrint("Title is $title");
    if (this.title == null) {
      this.title = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(this.title),
        ),
        body:
            SafeArea(top: false, bottom: false, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ServerForm(scaffoldKey),
            )),
      ),
    );
  }
}
