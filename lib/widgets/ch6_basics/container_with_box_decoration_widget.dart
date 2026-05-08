import 'package:flutter/material.dart';

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.lightGreen.shade300,
                Colors.lightGreen.shade600,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter World',
                style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(text: ' for'),
                  TextSpan(
                    text: ' Mobile',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
