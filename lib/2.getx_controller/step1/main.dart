// GetX 단순 상태관리 예제
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Simple State Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 컨트롤러 인스턴스 생성
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx를 사용하여 반응형 상태 관찰
            Obx(
              () => Text(
                'Count: ${controller.count}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
