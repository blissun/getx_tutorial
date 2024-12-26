import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/1.getx_route/step2/page/home_page.dart';
import 'package:getx_tutorial/1.getx_route/step2/page/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/second': (context) => const SecondPage(),
      // },
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/second', page: () => const SecondPage()),
      ],
      initialRoute: '/',
    );
  }
}
