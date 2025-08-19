import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeBatteryLevelPage extends StatefulWidget {
  const NativeBatteryLevelPage({super.key});
  @override
  State<NativeBatteryLevelPage> createState() => _NativeBatteryLevelPageState();
}

class _NativeBatteryLevelPageState extends State<NativeBatteryLevelPage> {
  static const platform = MethodChannel('native.android/jobs');
  String _batteryLevel = 'Battery Level unknown yet! Click The Button 😮‍💨';

  Future<void> getBatteryLevel() async {
    String batteryLevel;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery Level: $result %';
    } on PlatformException catch (e) {
      batteryLevel = 'failed to get battery level due to ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Native Battery Level"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          _batteryLevel,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getBatteryLevel,
        tooltip: 'Get Battery Level',
        child: const Icon(Icons.battery_charging_full),
      ),
    );
  }
}
