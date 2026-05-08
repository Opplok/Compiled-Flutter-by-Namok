import 'package:flutter/material.dart';
import '../screens/animated_balloon_page.dart';

class NavigateBalloonAnimation extends StatelessWidget {
  const NavigateBalloonAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.amber,
          child: TextButton(
            child: Text('Tap to\nfloat ballon'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AnimatedBalloonPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}
