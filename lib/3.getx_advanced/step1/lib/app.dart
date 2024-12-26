import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/login_page.dart';
import 'pages/secure_page.dart';
import 'middleware/auth_middleware.dart';

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
