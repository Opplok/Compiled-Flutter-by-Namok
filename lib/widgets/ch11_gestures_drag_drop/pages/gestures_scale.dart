import 'package:flutter/material.dart';

class GesturesScalePage extends StatefulWidget {
  const GesturesScalePage({super.key});

  @override
  _GesturesScalePageState createState() => _GesturesScalePageState();
}

class _GesturesScalePageState extends State<GesturesScalePage> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (details.scale != 1.0) {
      double currentScale = _lastScale * details.scale;
      if (currentScale < 0.5) currentScale = 0.5;
      setState(() {
        _currentScale = currentScale;
      });
    } else if (details.scale == 1.0) {
      Offset offsetAdjusted = (_startLastOffset - _lastOffset) / _lastScale;
      Offset currentOffset =
          details.focalPoint - (offsetAdjusted * _currentScale);
      setState(() {
        _currentOffset = currentOffset;
      });
    }
  }

  void _onDoubleTap() {
    double currentScale = _lastScale * 2.0;
    if (currentScale > 16.0) {
      _resetToDefault();
    } else {
      _lastScale = currentScale;
      setState(() {
        _currentScale = currentScale;
      });
    }
  }

  void _onLongPress() {
    setState(() {
      _resetToDefault();
    });
  }

  void _resetToDefault() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Move & Scale Image')),
      body: GestureDetector(
        onScaleStart: _onScaleStart,
        onScaleUpdate: _onScaleUpdate,
        onDoubleTap: _onDoubleTap,
        onLongPress: _onLongPress,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..scale(_currentScale)
                ..translate(_currentOffset.dx, _currentOffset.dy),
              alignment: FractionalOffset.center,
              child: Image.asset(
                'assets/images/elephant.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white54,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Scale: ${_currentScale.toStringAsFixed(4)}'),
                    Text('Offset: $_currentOffset'),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white54,
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => setState(() => _currentScale = 0.5),
                      onDoubleTap: () => setState(() => _currentScale = 16.0),
                      onLongPress: _onLongPress,
                      splashColor: Colors.lightGreenAccent,
                      highlightColor: Colors.lightBlueAccent,
                      child: Container(
                        height: 48,
                        width: 128,
                        color: Colors.black12,
                        child: Icon(Icons.touch_app, size: 32),
                      ),
                    ),
                    InkResponse(
                      onTap: () => setState(() => _currentScale = 0.5),
                      onDoubleTap: () => setState(() => _currentScale = 16.0),
                      onLongPress: _onLongPress,
                      splashColor: Colors.lightGreenAccent,
                      highlightColor: Colors.lightBlueAccent,
                      child: Container(
                        height: 48,
                        width: 128,
                        color: Colors.black12,
                        child: Icon(Icons.touch_app, size: 32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
