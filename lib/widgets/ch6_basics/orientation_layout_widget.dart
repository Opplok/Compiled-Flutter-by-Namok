import 'package:flutter/material.dart';

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            height: 100.0,
            width: 100.0,
            child: const Text('Portrait'),
          )
        : Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            height: 100.0,
            width: 200.0,
            child: const Text('Landscape'),
          );
  }
}
