import 'package:flutter/material.dart';
import 'package:compiled_flutter/widgets/ch9_listview/card_screen.dart';
import 'package:compiled_flutter/widgets/ch9_listview/custom_scroll_screen.dart';
import 'package:compiled_flutter/widgets/ch9_listview/gridview_screen.dart';
import 'package:compiled_flutter/widgets/ch9_listview/listview_screen.dart';
import 'package:compiled_flutter/widgets/ch9_listview/stack_screen.dart';

class CreatingScrollingListsAndEffects extends StatelessWidget {
  CreatingScrollingListsAndEffects({super.key});

  final List<Map<String, dynamic>> examples = [
    {
      'icon': Icons.list_alt,
      'title': 'ListView Example',
      'subtitle': 'Linear scrollable list',
      'color': Colors.blue,
      'screen': ListViewScreen(),
    },
    {
      'icon': Icons.grid_3x3,
      'title': 'GridView Example',
      'subtitle': 'Grid layout with tiles',
      'color': Colors.green,
      'screen': GridViewScreen(),
    },
    {
      'icon': Icons.layers,
      'title': 'Stack Example',
      'subtitle': 'Overlapping widgets',
      'color': Colors.purple,
      'screen': StackScreen(),
    },
    {
      'icon': Icons.waves,
      'title': 'CustomScrollView',
      'subtitle': 'Slivers & parallax effects',
      'color': Colors.orange,
      'screen': CustomScrollScreen(),
    },
    // ★ NEW CARD EXAMPLE ★
    {
      'icon': Icons.credit_card,
      'title': 'Card Examples',
      'subtitle': 'Elevation, shapes, borders, and ListTile',
      'color': Colors.red,
      'screen': CardScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 9: Scrolling Lists & Effects'),
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.cyan.shade50],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: examples.length,
          itemBuilder: (context, index) {
            final example = examples[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _buildExampleCard(
                context,
                example['icon'],
                example['title'],
                example['subtitle'],
                example['color'],
                example['screen'],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    Widget screen,
  ) {
    return Card(
      elevation: 6,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: color, size: 20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          ),
        ),
      ),
    );
  }
}
