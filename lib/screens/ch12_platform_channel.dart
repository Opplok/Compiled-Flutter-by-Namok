import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannel extends StatefulWidget {
  const PlatformChannel({super.key});

  @override
  State<PlatformChannel> createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  static const _methodChannel = MethodChannel(
    'platformchannel.companyname.com/deviceinfo',
  );

  // Get device info
  String _deviceInfo = '';

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = "Failed to get device info:'${e.message}'.";
    }

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
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
        child: ListTile(
          title: Text(
            'Device info:',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _deviceInfo,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
