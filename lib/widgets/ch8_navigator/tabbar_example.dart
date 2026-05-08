import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TabBar & TabBarView')),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.cake, size: 120, color: Colors.orange),
          Icon(Icons.sentiment_satisfied, size: 120, color: Colors.green),
          Icon(Icons.access_alarm, size: 120, color: Colors.purple),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.cake), text: 'Birthdays'),
            Tab(icon: Icon(Icons.sentiment_satisfied), text: 'Gratitude'),
            Tab(icon: Icon(Icons.access_alarm), text: 'Reminders'),
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }
}
