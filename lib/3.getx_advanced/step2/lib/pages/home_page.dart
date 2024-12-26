import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 서비스 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '데이터: ${controller.data.value}',
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(height: 20),
            Obx(() => controller.apiService.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: controller.fetchAndSaveData,
                    child: const Text('데이터 가져오기'),
                  )),
          ],
        ),
      ),
    );
  }
}
