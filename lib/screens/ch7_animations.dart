import 'package:flutter/material.dart';
import 'package:compiled_flutter/widgets/ch7_animations/widgets/animated_container_widget.dart';
import 'package:compiled_flutter/widgets/ch7_animations/widgets/animated_cross_fade_widget.dart';
import 'package:compiled_flutter/widgets/ch7_animations/widgets/animated_opacity_widget.dart';
import 'package:compiled_flutter/widgets/ch7_animations/widgets/navigate_balloon_animation.dart';

class AddingAnimationToAnApp extends StatelessWidget {
  const AddingAnimationToAnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainerWidget(),
            const Divider(),
            AnimatedCrossFadeWidget(),
            const Divider(),
            AnimatedOpacityWidget(),
            const Divider(),
            NavigateBalloonAnimation(),
          ],
        ),
      ),
    );
  }
}
