import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/templates/localization_content_template.dart';

class LanguageTemplate extends LocalizationContentTemplate {
  LanguageTemplate({
    required super.title,
    required super.isFirst,
  }) : super(lang: title);

  @override
  String get start => '''
    class $title extends $kInterfaceName {
      Map<String, Object?> get _contentMap => {
  ''';

  @override
  String get interfaceStart => '''
    abstract class $kInterfaceName {
      T getContent<T>(String key);
  ''';

  @override
  String toString() {
    String result = namespaces;
    if (isFirst) {
      result += interfaceStart + interface + end;
    }
    return result + start + contentMap + contentMapEnd + contentMapGetter + messages + end;
  }
}
