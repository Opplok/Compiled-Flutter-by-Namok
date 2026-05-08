import 'package:flutter/material.dart';

class TodoMenuItem {
  final String title;
  final Icon icon;
  TodoMenuItem({required this.title, required this.icon});
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: const Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Remind Me', icon: const Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: const Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: const Icon(Icons.audiotrack)),
];

class PopupMenuButtonWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: const Icon(Icons.view_list),
          onSelected: (valueSelected) {
            print('valueSelected: ${valueSelected.title}');
          },
          itemBuilder: (BuildContext context) {
            return foodMenuList.map((TodoMenuItem todoMenuItem) {
              return PopupMenuItem<TodoMenuItem>(
                value: todoMenuItem,
                child: Row(
                  children: <Widget>[
                    Icon(todoMenuItem.icon.icon),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    Text(todoMenuItem.title),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75.0);
}
