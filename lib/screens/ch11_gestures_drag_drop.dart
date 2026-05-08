import 'package:flutter/material.dart';
import 'package:compiled_flutter/widgets/ch11_gestures_drag_drop/pages/dismissible_trips.dart';
import 'package:compiled_flutter/widgets/ch11_gestures_drag_drop/pages/gestures_drag_drop.dart';
import 'package:compiled_flutter/widgets/ch11_gestures_drag_drop/pages/gestures_scale.dart';

class ApplyingInteractivity extends StatelessWidget {
  const ApplyingInteractivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chapter 11 Interactivity')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.touch_app),
            title: Text('1. GestureDetector + Drag & Drop'),
            subtitle: Text('Try It Out #1 & #2 combined'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GesturesDragDropPage()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.zoom_in),
            title: Text('2. Move & Scale Image'),
            subtitle: Text('Try It Out #3 & #4 combined'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GesturesScalePage()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.swipe),
            title: Text('3. Dismissible List (Trips)'),
            subtitle: Text('Try It Out #5'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DismissibleTripsPage()),
            ),
          ),
        ],
      ),
    );
  }
}
