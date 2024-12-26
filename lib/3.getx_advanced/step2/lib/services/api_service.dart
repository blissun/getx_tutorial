import 'package:get/get.dart';

class ApiService extends GetxService {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<ApiService> init() async {
    // API 클라이언트 초기화 시뮬레이션
    await Future.delayed(const Duration(seconds: 1));
    print('ApiService 초기화 완료');
    return this;
  }

  Future<String> fetchData() async {
    _isLoading.value = true;
    // API 호출 시뮬레이션
    await Future.delayed(const Duration(seconds: 2));
    _isLoading.value = false;
    return '서버에서 받은 데이터';
  }
}
