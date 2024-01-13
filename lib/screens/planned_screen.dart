import 'package:flutter/material.dart';

class PlannedScreen extends StatefulWidget {
  const PlannedScreen({super.key});

  @override
  State<PlannedScreen> createState() {
    return _PlannedScreenState();
  }
}

class _PlannedScreenState extends State<PlannedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planirane zabave'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
