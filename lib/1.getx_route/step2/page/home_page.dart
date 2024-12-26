import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_tutorial/1.getx_route/step2/page/second_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed('/second');
                Get.toNamed('/second');
              },
              child: const Text('Go to Second Screen with Get.toNamed'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const SecondPage());
                },
                child: const Text('Go to Second Screen with Get.to')),
          ],
        ),
      ),
    );
  }
}
