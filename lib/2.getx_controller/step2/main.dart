import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/state_management_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: StateManagementExample(),
    );
  }
}

class StateManagementExample extends StatelessWidget {
  StateManagementExample({super.key});

  final controller = Get.put(StateManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 상태관리 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Reactive State (.obs) - Obx 사용
            const Text('Reactive State (.obs) - Obx 사용:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Obx(() => Column(
              children: [
                Text('Count: ${controller.reactiveCount}'),
                Text('Text: ${controller.reactiveText}'),
                Text('List Length: ${controller.reactiveList.length}'),
              ],
            )),
            ElevatedButton(
              onPressed: controller.updateReactiveState,
              child: const Text('Update Reactive State'),
            ),
            const SizedBox(height: 40),

            // 2. Simple State - GetBuilder 사용
            const Text('Simple State - GetBuilder 사용:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GetBuilder<StateManagementController>(
              builder: (controller) => Column(
                children: [
                  Text('Count: ${controller.simpleCount}'),
                  Text('Text: ${controller.simpleText}'),
                  Text('List Length: ${controller.simpleList.length}'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.updateSimpleState,
              child: const Text('Update Simple State'),
            ),
          ],
        ),
      ),
    );
  }
}
