import 'package:flutter/material.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    BirthdaysPage(),
    GratitudePageSimple(),
    RemindersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar Demo')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Birthdays'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminders',
          ),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class BirthdaysPage extends StatelessWidget {
  const BirthdaysPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Icon(Icons.cake, size: 120, color: Colors.orange));
}

class GratitudePageSimple extends StatelessWidget {
  const GratitudePageSimple({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Icon(Icons.sentiment_satisfied, size: 120, color: Colors.green),
  );
}

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Center(child: Icon(Icons.access_alarm, size: 120, color: Colors.purple));
}
