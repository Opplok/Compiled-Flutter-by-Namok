import 'package:flutter/material.dart';

// ----- Navigator Example (main page) -----
class NavigatorExample extends StatefulWidget {
  const NavigatorExample({super.key});

  @override
  _NavigatorExampleState createState() => _NavigatorExampleState();
}

class _NavigatorExampleState extends State<NavigatorExample> {
  String _howAreYou = "…";

  void _openPageAbout({
    required BuildContext context,
    bool fullscreenDialog = false,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => AboutPage(),
      ),
    );
  }

  void _openPageGratitude({
    required BuildContext context,
    bool fullscreenDialog = false,
  }) async {
    final String? gratitudeResponse = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => GratitudePage(radioGroupValue: -1),
      ),
    );
    setState(() {
      _howAreYou = gratitudeResponse ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () =>
                _openPageAbout(context: context, fullscreenDialog: true),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'Gratitude',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}

// ----- About Page -----
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Text('About Page - fullscreen dialog')),
    );
  }
}

// ----- Gratitude Page -----
class GratitudePage extends StatefulWidget {
  final int radioGroupValue;
  const GratitudePage({super.key, required this.radioGroupValue});

  @override
  _GratitudePageState createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  List<String> gratitudeList = [];
  String? selectedGratitude;
  late int radioGroupValue;

  @override
  void initState() {
    super.initState();
    gratitudeList = ['Family', 'Friends', 'Coffee'];
    radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, selectedGratitude),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: radioGroupValue,
              onChanged: (int? index) {
                if (index == null) return;
                setState(() {
                  radioGroupValue = index;
                  selectedGratitude = gratitudeList[index];
                });
              },
            ),
            Text('Family'),
            Radio(
              value: 1,
              groupValue: radioGroupValue,
              onChanged: (int? index) {
                if (index == null) return;
                setState(() {
                  radioGroupValue = index;
                  selectedGratitude = gratitudeList[index];
                });
              },
            ),
            Text('Friends'),
            Radio(
              value: 2,
              groupValue: radioGroupValue,
              onChanged: (int? index) {
                if (index == null) return;
                setState(() {
                  radioGroupValue = index;
                  selectedGratitude = gratitudeList[index];
                });
              },
            ),
            Text('Coffee'),
          ],
        ),
      ),
    );
  }
}
