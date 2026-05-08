import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('Row 1'),
            const Padding(padding: EdgeInsets.all(16.0)),
            const Text('Row 2'),
            const Padding(padding: EdgeInsets.all(16.0)),
            const Text('Row 3'),
          ],
        ),
      ],
    );
  }
}
