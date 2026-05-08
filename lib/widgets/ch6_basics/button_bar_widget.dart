import 'package:flutter/material.dart';

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: OverflowBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.map), onPressed: () {}),
          IconButton(icon: const Icon(Icons.airport_shuttle), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.brush),
            highlightColor: Colors.purple,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
