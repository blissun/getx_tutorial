# GetX 상태관리 (State Management)

GetX는 Flutter에서 강력하고 효율적인 상태관리 기능을 제공합니다. GetX의 상태관리는 간단하면서도 성능이 뛰어나며, 코드의 가독성을 높여줍니다.

## 1. GetX 상태관리의 주요 특징

- **단순성**: 복잡한 설정 없이 간단하게 상태를 관리할 수 있습니다.
- **성능**: 필요한 위젯만 업데이트되어 앱의 성능을 최적화합니다.
- **생산성**: 적은 코드로 상태관리를 구현할 수 있어 개발 생산성이 향상됩니다.
- **분리성**: 비즈니스 로직과 UI를 명확하게 분리할 수 있습니다.

## 2. GetX Controller

GetX Controller는 상태관리의 핵심 컴포넌트입니다.

```dart
class CountController extends GetxController {
  var count = 0.obs;  // Observable 변수 선언
  
  void increment() {
    count++;  // 값 변경 시 자동으로 UI 업데이트
  }
}
```

## 3. 상태관리 방식

GetX는 세 가지 상태관리 방식을 제공합니다:

### 3.1 Reactive State Management (Rx Types)

GetX는 다양한 Rx 타입을 제공합니다:

- `RxString`: String 타입을 위한 Observable
- `RxInt`: int 타입을 위한 Observable
- `RxDouble`: double 타입을 위한 Observable
- `RxBool`: bool 타입을 위한 Observable
- `Rx<T>`: 커스텀 타입을 위한 Observable

```dart
class CountController extends GetxController {
  // .obs 대신 Rx 타입 사용
  final count = RxInt(0);
  final name = RxString('GetX');
  final isLoading = RxBool(false);
  final items = RxList<String>([]);
  final user = Rx<User>(User(name: 'John', age: 25));
  
  void increment() {
    count.value++;
  }
  
  void updateName(String newName) {
    name.value = newName;
  }
  
  void addItem(String item) {
    items.add(item);  // RxList는 직접 수정 가능
  }
  
  void updateUser() {
    user.value = User(name: 'Jane', age: 30);
  }
}
```

### 3.2 사용자 정의 클래스의 Rx 타입 관리

```dart
// 사용자 정의 클래스
class User {
  final RxString name;
  final RxInt age;
  
  User({
    required String name,
    required int age,
  })  : name = RxString(name),
        age = RxInt(age);
}

class UserController extends GetxController {
  // Rx<T>를 사용하여 전체 User 객체를 Observable로 만들기
  final user = Rx<User>(User(name: 'John', age: 25));
  
  // 또는 개별 필드를 Rx 타입으로 관리
  final userName = RxString('John');
  final userAge = RxInt(25);
  
  void updateUser() {
    // 전체 객체 업데이트
    user.value = User(name: 'Jane', age: 30);
    
    // 개별 필드 업데이트
    userName.value = 'Jane';
    userAge.value = 30;
  }
}
```

### 3.3 UI에서 Rx 타입 사용하기

```dart
class UserView extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Rx 타입 값 사용
        Obx(() => Text('Name: ${controller.userName.value}')),
        Obx(() => Text('Age: ${controller.userAge.value}')),
        
        // Rx<User> 객체 사용
        Obx(() => Text('User: ${controller.user.value.name.value}')),
        
        ElevatedButton(
          onPressed: controller.updateUser,
          child: Text('Update User'),
        ),
      ],
    );
  }
}
```

Rx 타입을 사용하는 것의 장점:
- 명시적인 타입 선언으로 코드의 가독성이 향상됩니다.
- IDE의 자동 완성 기능을 더 잘 활용할 수 있습니다.
- 타입 안정성이 향상됩니다.
- 컴파일 타임에 타입 오류를 잡을 수 있습니다.

### 3.4 Simple State Management (GetBuilder)

- 간단한 상태관리가 필요할 때 사용
- 메모리 사용량이 적음
- `update()` 메서드로 수동 업데이트

```dart
// Controller
GetBuilder<Controller>(
  builder: (_) => Text(controller.name)
)
```

### 3.5 사용자 정의 클래스의 Observable 관리

사용자 정의 클래스를 Observable로 관리하는 방법에는 두 가지가 있습니다:

#### 3.5.1 전체 클래스를 Observable로 만들기

```dart
class User {
  String name;
  int age;
  
  User({required this.name, required this.age});
}

class UserController extends GetxController {
  // 전체 User 객체를 Observable로 만들기
  final user = User(name: 'John', age: 25).obs;
  
  void updateUser() {
    // .value를 사용하여 전체 객체 업데이트
    user.value = User(name: 'Jane', age: 30);
    
    // 또는 update() 메서드를 사용하여 특정 필드만 업데이트
    user.update((val) {
      val?.name = 'Jane';
      val?.age = 30;
    });
  }
}
```

#### 3.5.2 개별 필드를 Observable로 만들기

```dart
class User {
  final RxString name;
  final RxInt age;
  
  User({required String name, required int age})
      : name = name.obs,
        age = age.obs;
}

class UserController extends GetxController {
  final user = User(name: 'John', age: 25);
  
  void updateUser() {
    // 개별 필드 직접 업데이트
    user.name.value = 'Jane';
    user.age.value = 30;
  }
}
```

#### 3.5.3 UI에서 사용하기

```dart
class UserView extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 전체 객체가 Observable일 경우
        Obx(() => Text('Name: ${controller.user.value.name}')),
        
        // 개별 필드가 Observable일 경우
        Obx(() => Text('Name: ${controller.user.name.value}')),
        
        ElevatedButton(
          onPressed: controller.updateUser,
          child: Text('Update User'),
        ),
      ],
    );
  }
}
```

각각의 방식은 상황에 따라 장단점이 있습니다:

- **전체 클래스 Observable**: 객체 전체를 한 번에 교체할 때 유용
- **개별 필드 Observable**: 특정 필드만 자주 업데이트되는 경우에 효율적

## 4. 상태관리 사용 예시

### 4.1 Controller 등록

```dart
// 전역적으로 Controller 등록
void main() {
  Get.put(CountController());
}
```

### 4.2 Controller 사용

```dart
// Controller 접근
final controller = Get.find<CountController>();

// UI에서 사용
Obx(() => Text('${controller.count}'))
```

## 5. 상태관리 Best Practices

1. **Controller 생명주기 관리**
   - `onInit()`: 컨트롤러 초기화
   - `onReady()`: 위젯이 렌더링된 후 호출
   - `onClose()`: 컨트롤러가 제거될 때 호출

2. **메모리 관리**
   - 필요하지 않은 컨트롤러는 `Get.delete()`로 제거
   - 임시 컨트롤러는 `fenix: true` 옵션 사용

3. **Worker 활용**
   - `ever`: 변수가 변경될 때마다 호출
   - `once`: 변수가 처음 변경될 때만 호출
   - `debounce`: 연속적인 변경에서 마지막 변경만 처리
   - `interval`: 일정 시간 간격으로 변경 처리

## 6. 주의사항

1. Observable 변수는 `.value`로 접근해야 합니다.
2. 복잡한 객체는 전체를 `.obs`로 만들거나 개별 필드를 observable로 만들어야 합니다.
3. 불필요한 리빌드를 피하기 위해 상태 변경 범위를 최소화해야 합니다.

## 7. 결론

GetX의 상태관리는 직관적이고 효율적인 방식으로 Flutter 앱의 상태를 관리할 수 있게 해줍니다. 
반응형과 단순 상태관리를 상황에 맞게 선택하여 사용하면 효과적인 앱 개발이 가능합니다.
