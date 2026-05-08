import 'package:flutter/material.dart';

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Icon(Icons.school, size: 48.0)],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.school, size: 48.0),
              Icon(Icons.brush, size: 48.0),
            ],
          );
  }
}
