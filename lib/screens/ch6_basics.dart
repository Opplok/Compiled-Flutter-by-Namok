import 'package:flutter/material.dart';
import 'package:compiled_flutter/widgets/ch6_basics/box_decorator_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/button_bar_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/buttons_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/column_and_row_nesting_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/column_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/container_with_box_decoration_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/form_validation_widget_state.dart';
import 'package:compiled_flutter/widgets/ch6_basics/grid_view_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/images_and_icon_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/input_decorator_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/orientation_builder_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/orientation_layout_icons_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/orientation_layout_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/popup_menu_button_widget.dart';
import 'package:compiled_flutter/widgets/ch6_basics/row_widget.dart';

class UsingCommonWidgets extends StatelessWidget {
  const UsingCommonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        flexibleSpace: SafeArea(
          child: Icon(Icons.photo_camera, size: 75.0, color: Colors.white70),
        ),
        bottom: const PopupMenuButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const ContainerWithBoxDecorationWidget(),
                const Divider(),
                const ColumnWidget(),
                const Divider(),
                const RowWidget(),
                const Divider(),
                const ColumnAndRowNestingWidget(),
                const Divider(),
                const ButtonsWidget(),
                const Divider(),
                const ButtonBarWidget(),
                const Divider(),
                const ImagesAndIconWidget(),
                const Divider(),
                const BoxDecoratorWidget(),
                const Divider(),
                const InputDecoratorsWidget(),
                const Divider(),
                const FormValidationWidget(),
                const Divider(),
                const OrientationLayoutIconsWidget(),
                const Divider(),
                const OrientationLayoutWidget(),
                const Divider(),
                const GridViewWidget(),
                const Divider(),
                const OrientationBuilderWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightGreen.shade100,
        child: const Icon(Icons.play_arrow),
      ),
      bottomNavigationBar: BottomAppBar(
        // hasNotch: true,
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(Icons.pause),
            const Icon(Icons.stop),
            const Icon(Icons.access_time),
            const Padding(padding: EdgeInsets.all(32.0)),
          ],
        ),
      ),
    );
  }
}
