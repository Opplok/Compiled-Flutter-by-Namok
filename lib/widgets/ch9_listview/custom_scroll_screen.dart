import 'package:flutter/material.dart';

class CustomScrollScreen extends StatelessWidget {
  const CustomScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomScrollView - Slivers'),
        elevation: 8,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.amber.shade50],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // SliverAppBar with parallax effect
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Parallax Effect'),
                background: Image.network(
                  'https://picsum.photos/800/400',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SliverList: 3 rows
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(3, (index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Row ${index + 1}'),
                    subtitle: Text('Subtitle Row ${index + 1}'),
                    trailing: Icon(Icons.star_border),
                  );
                }),
              ),
            ),
            // SliverSafeArea wrapping SliverGrid (to avoid notch)
            SliverSafeArea(
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.child_friendly,
                          size: 48,
                          color: Colors.amber,
                        ),
                        Divider(),
                        Text('Grid ${index + 1}'),
                      ],
                    ),
                  );
                }, childCount: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
