import 'package:flutter/material.dart';

class BottomAppBarExample extends StatelessWidget {
  const BottomAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomAppBar with Notch')),
      body: Center(
        child: Text('Tap the + button – it’s docked into the bottom bar'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.access_alarm),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.flight),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
