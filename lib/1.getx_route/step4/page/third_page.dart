import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$args'),
            Text('${args.runtimeType}'),
          ],
        ),
      ),
    );
  }
}
