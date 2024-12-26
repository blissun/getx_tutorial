import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_binding.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Service Example',
      initialBinding: AppBinding(),
      home: const HomePage(),
    );
  }
}
