import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Widget Examples')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Example 1: Basic Card with elevation
          Card(
            elevation: 8,
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Barista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Example 2: StadiumBorder
          Card(
            elevation: 8,
            shape: const StadiumBorder(),
            child: const ListTile(
              leading: Icon(Icons.stadium, color: Colors.orange),
              title: Text('Stadium Border Card'),
              subtitle: Text('Fully rounded ends'),
            ),
          ),

          const SizedBox(height: 20),

          // Example 3: UnderlineInputBorder
          Card(
            shape: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
            ),
            child: const ListTile(
              leading: Icon(Icons.line_weight, color: Colors.deepOrange),
              title: Text('Underline Border'),
              subtitle: Text('Only bottom border'),
            ),
          ),

          const SizedBox(height: 20),

          // Example 4: OutlineInputBorder with rounded corners and semi-transparent border
          Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.deepOrange.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const ListTile(
              leading: Icon(Icons.border_all, color: Colors.deepOrange),
              title: Text('Rounded Outline Border'),
              subtitle: Text('All sides, semi-transparent orange'),
            ),
          ),

          const SizedBox(height: 20),

          // Example 5: Card with ListTile (common pattern)
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(
                Icons.flight,
                size: 48,
                color: Colors.lightBlue,
              ),
              title: const Text('Airplane Trip'),
              subtitle: const Text('Very Cool'),
              trailing: const Text(
                '100%',
                style: TextStyle(color: Colors.lightBlue),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tapped on Card!')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
