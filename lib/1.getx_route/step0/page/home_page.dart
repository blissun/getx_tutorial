// 홈 페이지 화면
// GetX 네비게이션의 기본적인 사용법을 보여주는 예제
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GetX의 기본 네비게이션 - Get.to() 사용
            ElevatedButton(
              onPressed: () => Get.to(() => const SecondPage()),
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
