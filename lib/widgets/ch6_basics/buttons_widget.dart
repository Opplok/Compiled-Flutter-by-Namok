import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            TextButton(onPressed: () {}, child: const Text('Flag')),
            const Padding(padding: EdgeInsets.all(16.0)),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
              ),
              child: const Icon(Icons.flag),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(onPressed: () {}, child: const Text('Save')),
            const Padding(padding: EdgeInsets.all(16.0)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Icon(Icons.save),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(icon: const Icon(Icons.flight), onPressed: () {}),
            const Padding(padding: EdgeInsets.all(16.0)),
            IconButton(
              icon: const Icon(Icons.flight),
              iconSize: 42.0,
              color: Colors.lightGreen,
              tooltip: 'Flight',
              onPressed: () {},
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
