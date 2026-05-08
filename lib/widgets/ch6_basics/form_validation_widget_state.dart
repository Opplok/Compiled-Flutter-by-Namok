import 'package:flutter/material.dart';

class Order {
  String item = '';
  int quantity = 0;
}

class FormValidationWidget extends StatefulWidget {
  const FormValidationWidget({super.key});

  @override
  State<FormValidationWidget> createState() => _FormValidationWidgetState();
}

class _FormValidationWidgetState extends State<FormValidationWidget> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final Order _order = Order();

  String? _validateItemRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Item Required';
    }
    return null;
  }

  String? _validateItemCount(String? value) {
    if (value == null || value.isEmpty) {
      return 'At least one Item is Required';
    }
    final int valueAsInteger = int.tryParse(value) ?? 0;
    return valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  void _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formStateKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Espresso',
                labelText: 'Item',
              ),
              validator: (value) => _validateItemRequired(value),
              onSaved: (value) => _order.item = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '3',
                labelText: 'Quantity',
              ),
              validator: (value) => _validateItemCount(value),
              onSaved: (value) => _order.quantity = int.tryParse(value!) ?? 0,
            ),
            const Divider(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('Save'),
              onPressed: () => _submitOrder(),
            ),
          ],
        ),
      ),
    );
  }
}
