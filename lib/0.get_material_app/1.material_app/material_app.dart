// MaterialApp 예제
// GetX를 사용하지 않은 기본적인 MaterialApp 구현
import 'package:flutter/material.dart';
import '../page/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 일반적인 MaterialApp 사용
    // GetX의 네비게이션 기능을 사용할 수 없음
    return MaterialApp(
      title: 'Navigation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
