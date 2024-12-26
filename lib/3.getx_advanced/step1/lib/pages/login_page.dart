import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.put(AuthService());

    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  authService.isAuthenticated.value ? '로그인 됨' : '로그인 필요',
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authService.login();
                Get.snackbar('알림', '로그인 성공!');
              },
              child: const Text('로그인'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/secure');
              },
              child: const Text('보안 페이지로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
