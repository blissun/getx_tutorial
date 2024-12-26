# MaterialApp vs GetMaterialApp

MaterialApp과 GetMaterialApp의 차이점과 GetX를 사용할 때의 이점을 설명합니다.

## 1. 기본 설정 비교

### 1.1 MaterialApp
```dart
MaterialApp(
  title: 'Flutter App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: HomePage(),
  // 일반적인 라우트 설정
  routes: {
    '/': (context) => HomePage(),
    '/second': (context) => SecondPage(),
  },
  // 404 페이지
  onUnknownRoute: (settings) => MaterialPageRoute(
    builder: (context) => NotFoundPage(),
  ),
)
```

### 1.2 GetMaterialApp
```dart
GetMaterialApp(
  title: 'GetX App',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: HomePage(),
  // GetX 스타일의 라우트 설정
  getPages: [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/second', page: () => SecondPage()),
  ],
  // 404 페이지
  unknownRoute: GetPage(
    name: '/notfound',
    page: () => NotFoundPage(),
  ),
)
```

## 2. 라우트 관리 비교

### 2.1 MaterialApp의 네비게이션
```dart
// 페이지 이동
Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => SecondPage()),
);

// Named 라우트 이동
Navigator.of(context).pushNamed('/second');

// 데이터 전달
Navigator.of(context).pushNamed(
  '/second',
  arguments: {'id': 1},
);

// 데이터 받기
final args = ModalRoute.of(context)!.settings.arguments;
```

### 2.2 GetMaterialApp의 네비게이션
```dart
// 페이지 이동
Get.to(() => SecondPage());

// Named 라우트 이동
Get.toNamed('/second');

// 데이터 전달
Get.toNamed('/second', arguments: {'id': 1});

// 데이터 받기
final args = Get.arguments;
```