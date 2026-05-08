import 'package:flutter/material.dart';
import 'package:compiled_flutter/screens/ch7_animations.dart';
import 'package:compiled_flutter/screens/ch8_navigator.dart';
import 'package:compiled_flutter/screens/ch11_gestures_drag_drop.dart';
import 'package:compiled_flutter/screens/ch10_layouts.dart';
import 'package:compiled_flutter/screens/ch12_platform_channel.dart';
import 'package:compiled_flutter/screens/ch9_listview.dart';
import 'package:compiled_flutter/screens/ch6_basics.dart';

class Compilation extends StatelessWidget {
  const Compilation({super.key});

  @override
  Widget build(BuildContext context) {
    final compilations = [
      {
        "title": "6. Using Common Widgets",
        "icon": Icons.widgets_rounded,
        "color": Colors.blue,
        "page": () => UsingCommonWidgets(),
      },
      {
        "title": "7. Adding Animation to an App",
        "icon": Icons.animation_rounded,
        "color": Colors.purple,
        "page": () => AddingAnimationToAnApp(),
      },
      {
        "title": "8. Creating an App's Navigation",
        "icon": Icons.route_rounded,
        "color": Colors.teal,
        "page": () => AppNavigation(),
      },
      {
        "title": "9. Creating Scrolling Lists and Effects",
        "icon": Icons.view_list_rounded,
        "color": Colors.orange,
        "page": () => CreatingScrollingListsAndEffects(),
      },
      {
        "title": "10. Building Layouts",
        "icon": Icons.dashboard_customize_rounded,
        "color": Colors.green,
        "page": () => BuildingLayouts(),
      },
      {
        "title": "11. Applying Interactivity",
        "icon": Icons.touch_app_rounded,
        "color": Colors.redAccent,
        "page": () => ApplyingInteractivity(),
      },
      {
        "title": "12. Writing Platform-Native Code",
        "icon": Icons.code_rounded,
        "color": Colors.indigo,
        "page": () => PlatformChannel(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Flutter Compilations",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: compilations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final item = compilations[index];

              return CompilationButton(
                title: item["title"] as String,
                icon: item["icon"] as IconData,
                color: item["color"] as Color,
                onTap: () {
                  final pageBuilder = item["page"] as Widget Function()?;

                  if (pageBuilder != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => pageBuilder()),
                    );
                  } else {
                    print('Page not implemented yet');
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CompilationButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CompilationButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      elevation: 4,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 42, color: color),
              ),

              const SizedBox(height: 18),

              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
