import 'package:flutter/material.dart';

class GesturesDragDropPage extends StatefulWidget {
  const GesturesDragDropPage({super.key});

  @override
  _GesturesDragDropPageState createState() => _GesturesDragDropPageState();
}

class _GesturesDragDropPageState extends State<GesturesDragDropPage> {
  String _gestureDetected = 'Waiting for gesture...';
  Color _paintedColor = Colors.grey;

  void _displayGesture(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GestureDetector + Drag & Drop')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---------- GestureDetector ----------
              GestureDetector(
                onTap: () => _displayGesture('onTap'),
                onDoubleTap: () => _displayGesture('onDoubleTap'),
                onLongPress: () => _displayGesture('onLongPress'),
                onPanUpdate: (details) =>
                    _displayGesture('Pan: ${details.delta}'),
                child: Container(
                  color: Colors.lightGreen.shade100,
                  width: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.access_alarm, size: 98),
                      SizedBox(height: 20),
                      Text(_gestureDetected, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black, height: 44),
              // ---------- Draggable & DragTarget ----------
              Draggable<int>(
                data: Colors.deepOrange.value,
                childWhenDragging: Icon(
                  Icons.palette,
                  color: Colors.grey,
                  size: 48,
                ),
                feedback: Icon(Icons.brush, color: Colors.deepOrange, size: 80),
                child: Column(
                  children: [
                    Icon(Icons.palette, color: Colors.deepOrange, size: 48),
                    Text('Drag me below to change colour'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              DragTarget<int>(
                onAcceptWithDetails: (colorValue) {
                  setState(() {
                    _paintedColor = Color(colorValue as int);
                  });
                },
                builder: (context, acceptedData, rejectedData) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey.shade200,
                    child: acceptedData.isEmpty
                        ? Text(
                            'Drag To and see colour change',
                            style: TextStyle(color: _paintedColor),
                          )
                        : Text(
                            'Painting Colour: ${acceptedData[0]}',
                            style: TextStyle(
                              color: Color(acceptedData[0]!),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                },
              ),
              Divider(color: Colors.black, height: 44),
            ],
          ),
        ),
      ),
    );
  }
}
