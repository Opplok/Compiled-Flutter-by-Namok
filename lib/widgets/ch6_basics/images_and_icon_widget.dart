import 'package:flutter/material.dart';

class ImagesAndIconWidget extends StatelessWidget {
  const ImagesAndIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade100,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 32, color: Colors.grey),
                Text('Local Image', style: TextStyle(fontSize: 12)),
                Text(
                  '(Web Issue)',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        Image.network(
          'https://picsum.photos/250?image=9',
          // 'https://flutter.io/images/catalog-widget-placeholder.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        const Icon(Icons.brush, color: Colors.lightBlue, size: 48.0),
      ],
    );
  }
}
