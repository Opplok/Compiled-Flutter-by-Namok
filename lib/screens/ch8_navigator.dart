import 'package:flutter/material.dart';
import 'package:compiled_flutter/widgets/ch8_navigator/bottom_app_bar_example.dart';
import 'package:compiled_flutter/widgets/ch8_navigator/bottom_nav_bar_example.dart';
import 'package:compiled_flutter/widgets/ch8_navigator/hero_example.dart';
import 'package:compiled_flutter/widgets/ch8_navigator/navigator_example.dart';
import 'package:compiled_flutter/widgets/ch8_navigator/tabbar_example.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Demos')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Choose an example',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('Navigator (push/pop)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigatorExample()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.flight_takeoff),
              title: Text('Hero Animation'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroExample()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('BottomNavigationBar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarExample(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.layers),
              title: Text('BottomAppBar (notch)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomAppBarExample(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tab),
              title: Text('TabBar & TabBarView'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarExample()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_rounded),
              title: Text('Return Compilation'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Open the drawer (swipe from left or tap the hamburger icon) to try each navigation pattern.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
