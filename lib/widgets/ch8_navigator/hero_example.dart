import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation')),
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: 'paint_icon',
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: 120,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FlyPage()),
            );
          },
        ),
      ),
    );
  }
}

class FlyPage extends StatelessWidget {
  const FlyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(title: Text('Fly')),
      body: Center(
        child: Hero(
          tag: 'paint_icon',
          child: Icon(
            Icons.format_paint,
            color: Colors.lightGreen,
            size: width,
          ),
        ),
      ),
    );
  }
}
