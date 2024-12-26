import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Middleware Example',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/secure',
          page: () => const SecurePage(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}

// 인증 상태를 관리하는 서비스
class AuthService extends GetxService {
  final isAuthenticated = false.obs;

  void login() {
    isAuthenticated.value = true;
  }

  void logout() {
    isAuthenticated.value = false;
  }
}

// 미들웨어 구현
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    return authService.isAuthenticated.value ? null : const RouteSettings(name: '/');
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('${page?.name} 페이지로 이동 시도');
    return page;
  }
}

// 로그인 페이지
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

// 보안 페이지
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
              '인증된 사용자만 볼 수 있는 페이지',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authService.logout();
                Get.offAll(() => const LoginPage());
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
