import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SecondChildPage extends StatelessWidget {
  const SecondChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Second Child Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$id'),
          ElevatedButton(
            onPressed: Get.back,
            child: const Text('Get.back()'),
          ),
        ],
      ),
    );
  }
}
