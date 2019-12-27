import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Touchpad extends StatefulWidget {
  final ValueChanged<Offset> onChanged;
  final String name;
  Paint paint;

  Touchpad({Key key, this.onChanged, this.name = "touchpad", this.paint})
      : super(key: key) {
    if (this.paint == null) {
      this.paint = new Paint()
        ..color = Colors.blue[400]
        ..style = PaintingStyle.fill;
    }
  }

  @override
  _TouchpadState createState() => new _TouchpadState(name, paint);
}

class _TouchpadState extends State<Touchpad> {
  double _xPos = 0.0;
  double _yPos = 0.0;
  final String name;
  final Paint _paint;

  _TouchpadState(this.name, this._paint);

  void onChanged(Offset offset) {
    final RenderBox refbox = context.findRenderObject();
    Offset pos = refbox.globalToLocal(offset);
    if (widget.onChanged != null) {
      widget.onChanged(pos);
    }
    double width = refbox.size.width;
    double height = refbox.size.height;

    double x = pos.dx;
    double y = pos.dy;

    if (x > width) {
      x = width;
    } else if (x < 0.0) {
      x = 0.0;
    }
    if (y > height) {
      y = height;
    } else if (y < 0.0) {
      y = 0.0;
    }
    print("$name\n\tX: $x:$width\n\tY: $y:$height\n");
    setState(() {
      _xPos = x - (width / 2);
      _yPos = y - (height / 2);
    });
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      //
    }
  }

  void _handlePanStart(DragStartDetails details) {
    onChanged(details.globalPosition);
  }

  void _handlePanEnd(DragEndDetails details) {
    print('end');
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    onChanged(details.globalPosition);
  }

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: new BoxConstraints.expand(),
      child: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: _handlePanStart,
        onPanEnd: _handlePanEnd,
        onPanUpdate: _handlePanUpdate,
        child: new CustomPaint(
            painter: new TouchpadGridPainter(paint: _paint),
            child: new Center(
              child: new CustomPaint(
                painter: new TouchpadPainter(_xPos, _yPos, paint: _paint),
              ),
            )),
      ),
    );
  }
}

class TouchpadPainter extends CustomPainter {
  static const markRad = 10.0;

  Offset pos;
  Paint _paint;

  TouchpadPainter(final double x, final double y, {Paint paint}) {
    if (paint != null) {
      _paint = paint;
    } else {
      _paint = new Paint()
        ..color = Colors.blue[400]
        ..style = PaintingStyle.fill;
    }
    pos = new Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(new Offset(pos.dx, pos.dy), markRad, _paint);
  }

  @override
  bool shouldRepaint(TouchpadPainter oldDelegate) =>
      pos.dx != oldDelegate.pos.dx && pos.dy != oldDelegate.pos.dy;
}

class TouchpadGridPainter extends CustomPainter {
  Offset pos;
  Paint _paint;

  TouchpadGridPainter({Paint paint}) {
    if (paint != null) {
      this._paint = paint;
    } else {
      this._paint = new Paint()
        ..color = Colors.blue[400]
        ..style = PaintingStyle.fill;
    }
    this.pos = new Offset(0, 0);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(size.centerLeft(pos), size.centerRight(pos), _paint);
    canvas.drawLine(size.topCenter(pos), size.bottomCenter(pos), _paint);
  }

  @override
  bool shouldRepaint(TouchpadGridPainter oldDelegate) =>
      pos.dx != oldDelegate.pos.dx && pos.dy != oldDelegate.pos.dy;
}
