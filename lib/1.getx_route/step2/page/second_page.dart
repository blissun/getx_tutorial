import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pop;
            Get.back();
          },
          child: const Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}
