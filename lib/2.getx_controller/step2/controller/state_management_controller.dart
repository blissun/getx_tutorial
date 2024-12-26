import 'package:get/get.dart';

class StateManagementController extends GetxController {
  // 1. Reactive State (.obs를 사용한 반응형 상태관리)
  // - 값이 변경될 때 자동으로 UI가 업데이트됨
  // - Obx나 GetX 위젯과 함께 사용
  final reactiveCount = 0.obs;
  final reactiveText = 'Hello'.obs;
  final reactiveList = <String>[].obs;

  void updateReactiveState() {
    // .value를 사용하여 값을 업데이트
    reactiveCount.value++;
    reactiveText.value = 'Updated Text';
    reactiveList.add('New Item');
    // obs 변수는 자동으로 UI 업데이트
  }

  // 2. Simple State (일반 변수를 사용한 단순 상태관리)
  // - update() 메서드를 호출해야 UI가 업데이트됨
  // - GetBuilder 위젯과 함께 사용
  int simpleCount = 0;
  String simpleText = 'Hello';
  List<String> simpleList = [];

  void updateSimpleState() {
    simpleCount++;
    simpleText = 'Updated Text';
    simpleList.add('New Item');
    update(); // GetBuilder를 사용하는 UI를 수동으로 업데이트
  }
}
