import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SecondChildPage extends StatelessWidget {
  const SecondChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Second Child Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: Get.back,
          child: const Text('Get.back()'),
        ),
      ),
    );
  }
}
