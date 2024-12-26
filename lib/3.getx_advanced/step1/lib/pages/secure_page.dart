import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class SecurePage extends StatelessWidget {
  const SecurePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('보안 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '보안 페이지에 접근했습니다!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authService.logout();
                Get.back();
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
