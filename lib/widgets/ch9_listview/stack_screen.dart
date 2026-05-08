import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Example'),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade50, Colors.pink.shade50],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 7,
          itemBuilder: (context, index) {
            // Even rows: simple stack with image and two positioned widgets
            if (index.isEven) {
              return Card(
                elevation: 8,
                shadowColor: Colors.purple.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      // Background image
                      Image.network(
                        'https://picsum.photos/400/200?random=$index',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      // Bottom-left circle avatar
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/80/80?random=$index',
                          ),
                        ),
                      ),
                      // Bottom-right text
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Text(
                          'Item $index',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            // Odd rows: stack with favorite icon (FractionalTranslation)
            else {
              return Card(
                elevation: 8,
                shadowColor: Colors.pink.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 220,
                  color: Colors.black87,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://picsum.photos/400/200?random=$index',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        // Favorite star pinned to top-right outside the stack
                        Positioned(
                          top: 0,
                          right: 0,
                          child: FractionalTranslation(
                            translation: Offset(0.3, -0.3),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white30,
                              child: Icon(Icons.star, color: Colors.white),
                            ),
                          ),
                        ),
                        // Bottom-right circle avatar
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/80/80?random=$index',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
