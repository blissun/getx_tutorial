import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${controller.count}',
                  style: const TextStyle(fontSize: 30),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.increment,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.toggleTheme,
              child: Text('change_theme'.tr),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.toggleLanguage,
              child: Text('change_language'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
