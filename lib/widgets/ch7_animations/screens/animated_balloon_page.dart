import 'package:flutter/material.dart';
import '../widgets/animated_balloon.dart';

class AnimatedBalloonPage extends StatelessWidget {
  const AnimatedBalloonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('AnimationController'),
        centerTitle: true,
      ),
      body: SafeArea(child: AnimatedBalloon()),
    );
  }
}
