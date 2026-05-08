import 'package:flutter/material.dart';

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text('Columns and Row Nesting 1'),
        const Text('Columns and Row Nesting 2'),
        const Text('Columns and Row Nesting 3'),
        const Padding(padding: EdgeInsets.all(16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text('Row Nesting 1'),
            Text('Row Nesting 2'),
            Text('Row Nesting 3'),
          ],
        ),
      ],
    );
  }
}
