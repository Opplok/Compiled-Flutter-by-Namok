import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.cyan.shade50],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: 20,
            itemBuilder: (context, index) {
              // Header row (index 0)
              if (index == 0) {
                return Container(
                  height: 140,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.orange.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade400,
                            Colors.orange.shade200,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Barista',
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Travel Plans',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              // Rows 1–3 (cards with ListTile)
              else if (index <= 3) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  elevation: 6,
                  shadowColor: Colors.lightBlue.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue.withOpacity(0.1),
                          Colors.blue.withOpacity(0.05),
                        ],
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.flight,
                          size: 40,
                          color: Colors.lightBlue,
                        ),
                      ),
                      title: Text(
                        'Airplane $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Very Cool',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${index * 7}%',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped on Row $index'),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              // Remaining rows (plain ListTile)
              else {
                final isBookmarked = (index % 3).isOdd;
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  elevation: 4,
                  shadowColor: Colors.lightGreen.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightGreen.withOpacity(0.08),
                          Colors.green.withOpacity(0.04),
                        ],
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.directions_car,
                          size: 40,
                          color: Colors.lightGreen,
                        ),
                      ),
                      title: Text(
                        'Car $index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Very Cool',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      trailing: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.amber : Colors.grey,
                        size: 28,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped on Row $index'),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
