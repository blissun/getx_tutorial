# GetX 튜토리얼

GetX는 Flutter를 위한 강력하고 가벼운 상태관리 및 종속성 주입 솔루션입니다. 높은 성능, 적은 리소스 사용, 사용하기 쉬운 API를 제공합니다.

## 목차
1. [GetX 소개](#getx의-세-가지-기본-원칙)
2. [주요 기능](#getx의-주요-기능)
3. [프로젝트 구조](#프로젝트-구조)
4. [상태관리 라이브러리 비교](#상태관리-라이브러리-비교)
5. [GetX의 부가기능](#getx의-부가기능)

## GetX의 세 가지 기본 원칙

1. **성능(PERFORMANCE)**
   - 최소한의 리소스 사용
   - 필요한 위젯만 업데이트
   - 메모리 최적화

2. **생산성(PRODUCTIVITY)**
   - 간결하고 직관적인 API
   - 적은 코드로 많은 기능 구현
   - 빠른 개발 속도

3. **조직화(ORGANIZATION)**
   - 비즈니스 로직과 UI 완전 분리
   - 클린 아키텍처 지원
   - 테스트 용이성

## GetX의 주요 기능

### 1. 상태 관리 (State Management)
- 단순하고 실용적인 반응형 프로그래밍
- 두 가지 상태 관리자 제공
   ```dart
   // 반응형 상태 관리
   final count = 0.obs;

   // 단순 상태 관리
   GetBuilder<Controller>(
      builder: (controller) => Text('${controller.count}')
   )
   ```

### 2. 라우트 관리 (Route Management)
- 간단한 네비게이션 API
- Named 라우트 지원
   ```dart
   // 간단한 네비게이션
   Get.to(() => NextScreen());

   // Named 라우트
   Get.toNamed('/next');
   ```

### 3. 종속성 관리 (Dependency Management)
- 강력한 종속성 주입
- 스마트한 메모리 관리
   ```dart
   // 종속성 주입
   Get.put(Controller());

   // 지연 로딩
   Get.lazyPut(() => Service());
   ```

## 프로젝트 구조

```
lib/
├── 0.get_material_app/     # GetMaterialApp 기본
│   ├── 1.material_app/     # MaterialApp 예제
│   └── 2.get_material_app/ # GetMaterialApp 예제
│
├── 1.getx_route/           # 라우팅
│   ├── step0/             # 기본 라우팅
│   ├── step1/             # Named 라우트
│   ├── step2/             # GetX 라우트
│   ├── step3/             # 중첩 라우트
│   └── step4/             # 동적 라우트
│
├── 2.getx_controller/      # 상태관리
│   ├── step0/             # 기본 상태관리
│   ├── step1/             # 반응형 상태관리
│   ├── step2/             # GetxController
│   └── step3/             # 바인딩
│
└── 3.getx_advanced/        # 고급 기능
    ├── step1/             # 미들웨어
    ├── step2/             # 서비스
    └── step3/             # 국제화, 동적 테마 변경
```

## 상태관리 라이브러리 비교

| 특징 | GetX | Riverpod | Bloc |
|------|------|----------|------|
| **학습 곡선** | 낮음 | 중간 | 높음 |
| **보일러플레이트** | 적음 | 중간 | 많음 |
| **성능** | 좋음 | 매우 좋음 | 좋음 |
| **디버깅** | 쉬움 | 매우 좋음 | 좋음 |
| **코드 구조화** | 유연함 | 엄격함 | 매우 엄격함 |
| **테스트 용이성** | 중간 | 매우 좋음 | 매우 좋음 |
| **상태 추적** | 기본적 | 뛰어남 | 뛰어남 |
| **메모리 관리** | 수동 | 자동 | 수동 |
| **타입 안정성** | 중간 | 매우 높음 | 높음 |
| **커뮤니티** | 큼 | 성장 중 | 매우 큼 |

### 각 라이브러리의 특징

1. **GetX**
   - 올인원 솔루션 (상태관리, 라우팅, DI 등)
   - 매우 간단한 API
   - 빠른 개발 속도
   - context 없이 사용 가능

2. **Riverpod**
   - Provider의 개선된 버전
   - 컴파일 타임 안정성
   - 뛰어난 테스트 지원
   - 상태 관리에 특화

3. **Bloc**
   - 엄격한 아키텍처 패턴
   - 예측 가능한 상태 흐름
   - 큰 규모의 앱에 적합
   - 뛰어난 테스트 용이성

