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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/second_child');
              },
              child: const Text('/second_child'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/second/second_child');
              },
              child: const Text('/second/second_child'),
            ),
          ],
        ),
      ),
    );
  }
}
