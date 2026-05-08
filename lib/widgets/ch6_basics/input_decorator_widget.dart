import 'package:flutter/material.dart';

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
          decoration: InputDecoration(
            labelText: "Notes",
            labelStyle: const TextStyle(color: Colors.purple),
            border: OutlineInputBorder(),
          ),
        ),
        const Divider(color: Colors.lightGreen, height: 50.0),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Enter your notes'),
        ),
      ],
    );
  }
}
