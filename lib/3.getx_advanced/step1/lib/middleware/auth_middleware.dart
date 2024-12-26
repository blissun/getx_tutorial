import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

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
