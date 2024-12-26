import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'translations/messages.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Advanced Example',
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
