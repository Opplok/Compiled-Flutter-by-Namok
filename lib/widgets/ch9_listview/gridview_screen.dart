import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  final List<IconData> icons = [
    Icons.free_breakfast,
    Icons.access_alarms,
    Icons.directions_car,
    Icons.flight,
    Icons.cake,
    Icons.card_giftcard,
    Icons.change_history,
    Icons.face,
    Icons.star,
    Icons.headset_mic,
    Icons.directions_walk,
    Icons.sentiment_satisfied,
    Icons.cloud_queue,
    Icons.exposure,
    Icons.gps_not_fixed,
    Icons.child_friendly,
    Icons.child_care,
    Icons.edit_location,
    Icons.event_seat,
    Icons.lightbulb_outline,
  ];

  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Example'),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.teal.shade50],
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 170,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              shadowColor: Colors.green.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreen.withOpacity(0.2),
                      Colors.green.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped grid item $index'),
                        duration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          icons[index % icons.length],
                          size: 56,
                          color: Colors.lightGreen,
                        ),
                      ),
                      SizedBox(height: 12),
                      Divider(indent: 16, endIndent: 16),
                      Text(
                        'Item $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
