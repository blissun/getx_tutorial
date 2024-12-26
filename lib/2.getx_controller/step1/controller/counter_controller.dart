import 'package:get/get.dart';

class CounterController extends GetxController {
  // .obs를 사용하여 반응형 상태 생성
  final _count = 0.obs;
  
  // getter를 통해 count 값 접근
  int get count => _count.value;
  
  // 증가 메서드
  void increment() {
    _count.value++;
  }
  
  // 감소 메서드
  void decrement() {
    _count.value--;
  }
}
