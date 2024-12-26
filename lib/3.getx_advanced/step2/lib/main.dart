import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'services/storage_service.dart';
import 'services/api_service.dart';

void main() {
  initServices(); // 서비스 초기화
  runApp(const MyApp());
}

// 서비스 초기화
Future<void> initServices() async {
  await Get.putAsync(() async => StorageService());
  await Get.putAsync(() async => ApiService());
}
