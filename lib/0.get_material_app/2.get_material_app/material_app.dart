// GetMaterialApp 예제
// GetX의 기능을 사용하기 위한 GetMaterialApp 구현
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_translation.dart';
import '../page/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp 사용
    // GetX의 모든 기능(네비게이션, 상태관리, 의존성 주입 등)을 사용 가능
    return GetMaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      // },
      getPages: [GetPage(name: '/', page: () => const HomeScreen())],
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeft,
      translations: CustomTranslation(),
      transitionDuration: const Duration(milliseconds: 1000),
      fallbackLocale: const Locale('en', 'US'), // 지원하지 않는 언어에 대한 대체 언어
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const Scaffold(
          body: Center(child: Text('Not Found')),
        ),
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put('Hello World');
        },
      ),
    );
  }
}
