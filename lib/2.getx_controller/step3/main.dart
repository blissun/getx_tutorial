// GetX의 다양한 상태 관찰 위젯 예제
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/user_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX State Observers',
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
    // 컨트롤러 초기화
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX State Observers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Obx 위젯
            // 가장 간단한 형태의 상태 관찰
            const Text('1. Obx Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text('Name: ${controller.user.value.name}')),
            const SizedBox(height: 20),

            // 2. GetX 위젯
            // 더 세밀한 제어가 가능한 상태 관찰
            const Text('2. GetX Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            GetX<UserController>(
              builder: (controller) => Text('Age: ${controller.user.value.age}'),
              init: controller, // 컨트롤러 초기화
              initState: (_) {}, // 위젯 초기화 시 실행
              dispose: (_) {}, // 위젯 dispose 시 실행
            ),
            const SizedBox(height: 20),

            // 3. GetBuilder 위젯
            // 수동 상태 관리를 위한 위젯
            const Text('3. GetBuilder Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            GetBuilder<UserController>(
              init: controller,
              builder: (controller) => Text('Email: ${controller.email}'),
            ),
            const SizedBox(height: 20),

            // 여러 상태를 한번에 보여주기
            const Text('4. Combined State Example:', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Obx로 여러 상태 관찰
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${controller.user.value.name}'),
                      Text('Age: ${controller.user.value.age}'),
                    ],
                  )),
                  // GetBuilder로 수동 상태 관찰
                  GetBuilder<UserController>(
                    builder: (controller) => Text('Email: ${controller.email}'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 상태 변경 버튼들
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: controller.updateUserInfo,
                  child: const Text('Update User Info'),
                ),
                ElevatedButton(
                  onPressed: () => controller.updateEmail('username@example.com'),
                  child: const Text('Update Email'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
