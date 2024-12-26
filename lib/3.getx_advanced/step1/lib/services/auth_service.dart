import 'package:get/get.dart';

class AuthService extends GetxService {
  final isAuthenticated = false.obs;

  void login() {
    isAuthenticated.value = true;
  }

  void logout() {
    isAuthenticated.value = false;
  }
}
