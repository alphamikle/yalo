import 'package:yalo/src/constants/common_constants.dart';
import 'package:yalo/src/templates/localization_content_template.dart';

class LanguageTemplate extends LocalizationContentTemplate {
  LanguageTemplate(String title, bool isFirst) : super(title, title, isFirst);

  @override
  String get start => '''
    class _$title extends $ABSTRACT_CLASS_NAME {
  ''';

  @override
  String get interfaceStart => '''
    abstract class $ABSTRACT_CLASS_NAME {
  ''';

  @override
  String toString() {
    String result = namespaces;
    if (isFirst) {
      result += interfaceStart + interface + end;
    }
    return result + start + messages + end;
  }
}
