import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final storageService = Get.find<StorageService>();
  final apiService = Get.find<ApiService>();
  final data = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // 저장된 데이터 로드
    final savedData = storageService.getData('lastData');
    if (savedData != null) {
      data.value = savedData;
    }
  }

  Future<void> fetchAndSaveData() async {
    final newData = await apiService.fetchData();
    data.value = newData;
    storageService.saveData('lastData', newData);
  }
}
