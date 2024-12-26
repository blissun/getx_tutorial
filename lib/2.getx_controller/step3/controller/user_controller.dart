import 'package:get/get.dart';
import '../model/user.dart';

class UserController extends GetxController {
  // 1. Rx 변수 (Obx, GetX, Observer에서 사용)
  final user = User(name: 'John Doe', age: 25).obs;
  
  // 2. 일반 변수 (GetBuilder에서 사용)
  String email = 'john@example.com';
  
  // Rx 변수 업데이트
  void updateUserInfo() {
    user.update((val) {
      val?.name = 'Jane Doe';
      val?.age = val.age + 1;
    });
  }
  
  // 일반 변수 업데이트
  void updateEmail(String email) {
    this.email = email.trim();
    update(); // GetBuilder를 위한 수동 업데이트
  }

  // Worker 예제
  @override
  void onInit() {
    super.onInit();

    // ever: 값이 변경될 때마다 호출
    ever(user, (_) => print('User was changed'));

    // once: 첫 번째 변경에만 호출
    once(user, (_) => print('First time user was changed'));

    // debounce: 연속적인 변경에서 마지막 변경 후 일정 시간이 지난 후 호출
    debounce(
      user,
      (_) => print('User was changed (debounced)'),
      time: const Duration(seconds: 1),
    );

    // interval: 일정 간격으로 호출
    interval(
      user,
      (_) => print('User was changed (interval)'),
      time: const Duration(seconds: 2),
    );
  }
}
