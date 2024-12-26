import 'package:get/get.dart';

class StorageService extends GetxService {
  final _data = <String, dynamic>{}.obs;

  Future<StorageService> init() async {
    // 로컬 저장소 초기화 시뮬레이션
    await Future.delayed(const Duration(seconds: 1));
    print('StorageService 초기화 완료');
    return this;
  }

  void saveData(String key, dynamic value) {
    _data[key] = value;
    print('데이터 저장: $key = $value');
  }

  dynamic getData(String key) => _data[key];
}
