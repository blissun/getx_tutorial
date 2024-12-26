import 'package:get/get.dart';

class CustomTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'home_title': 'Home Screen',
          'second_title': 'Second Screen',
        },
        'pt_BR': {
          'hello': 'Olá Mundo',
          'home_title': 'Tela Inicial',
          'second_title': 'Segunda Tela',
        },
        'ko_KR': {
          'hello': '안녕하세요',
          'home_title': '홈 화면',
          'second_title': '두 번째 화면',
        },
      };
}
