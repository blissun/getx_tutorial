import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'change_theme': 'Change Theme',
          'change_language': 'Change Language',
        },
        'ko_KR': {
          'hello': '안녕하세요',
          'change_theme': '테마 변경',
          'change_language': '언어 변경',
        },
      };
}
