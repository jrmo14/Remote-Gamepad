import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// Little widget to help visualize where each widget starts/ends
class DebugBorder extends StatelessWidget {
  final Widget child;
  final Color color;

  DebugBorder({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        decoration: BoxDecoration(
          border: Border.all(color: (color == null) ? Colors.red : this.color),
        ));
  }
}
