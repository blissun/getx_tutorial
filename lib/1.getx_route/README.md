# GetX 라우팅 (Navigation)

GetX는 Flutter에서 간단하고 강력한 라우팅 시스템을 제공합니다. 복잡한 설정 없이도 페이지 간 이동과 데이터 전달을 쉽게 구현할 수 있습니다.

## 1. 기본 라우팅 기능

### 1.1 페이지 이동
```dart
// 다음 페이지로 이동
Get.to(() => NextPage());

// 이전 페이지로 돌아가기
Get.back();

// 모든 이전 페이지를 제거하고 새 페이지로 이동
Get.off(() => NextPage());

// 모든 이전 페이지를 제거하고 여러 페이지 이동
Get.offAll(() => HomePage());
```

### 1.2 Named 라우트 사용
```dart
// 라우트 설정
GetMaterialApp(
  initialRoute: '/',
  getPages: [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/second', page: () => SecondPage()),
    GetPage(name: '/third', page: () => ThirdPage()),
  ],
)

// Named 라우트로 이동
Get.toNamed('/second');
Get.offNamed('/second');
Get.offAllNamed('/home');
```

## 2. 데이터 전달

### 2.1 Arguments 전달
```dart
// 데이터 전달
Get.to(() => NextPage(), arguments: {'id': 1, 'name': 'John'});

// 데이터 받기
var data = Get.arguments;
```

### 2.2 Parameters 전달
```dart
// URL 파라미터 전달
Get.toNamed('/user/123?name=John&age=25');

// 파라미터 받기
var id = Get.parameters['id'];
var name = Get.parameters['name'];
```

## 3. 라우트 미들웨어

```dart
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 인증되지 않은 사용자는 로그인 페이지로 리다이렉트
    return authService.isAuthenticated 
        ? null 
        : RouteSettings(name: '/login');
  }
}

// 미들웨어 적용
GetPage(
  name: '/secure',
  page: () => SecurePage(),
  middlewares: [AuthMiddleware()],
)
```

## 4. 중첩 네비게이션

```dart
GetMaterialApp(
  initialRoute: '/',
  getPages: [
    GetPage(
      name: '/',
      page: () => HomePage(),
      children: [
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/settings', page: () => SettingsPage()),
      ],
    ),
  ],
)
```

## 5. 라우트 트랜지션

```dart
// 커스텀 트랜지션 설정
Get.to(
  () => NextPage(),
  transition: Transition.zoom,  // 또는 fade, rightToLeft 등
  duration: Duration(milliseconds: 500),
);

// Named 라우트에서 트랜지션 설정
GetPage(
  name: '/next',
  page: () => NextPage(),
  transition: Transition.zoom,
)
```

## 6. 라우팅 Best Practices

1. **라우트 상수 사용**
```dart
abstract class Routes {
  static const HOME = '/';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
}
```

2. **페이지 바인딩**
```dart
GetPage(
  name: '/home',
  page: () => HomePage(),
  binding: HomeBinding(),
)
```

3. **동적 URL 처리**
```dart
GetPage(
  name: '/user/:id',
  page: () => UserPage(),
)
```

## 7. 주의사항

1. Named 라우트 사용 시 반드시 `GetMaterialApp`을 사용해야 합니다.
2. 라우트 이름은 항상 '/'로 시작해야 합니다.
3. 중첩 라우트 사용 시 전체 경로를 정확히 지정해야 합니다.
4. 미들웨어는 라우트별로 적용 가능합니다.
