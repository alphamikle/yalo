import 'package:yalo/src/templates/localization_content_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

class NamespaceTemplate extends LocalizationContentTemplate {
  NamespaceTemplate({
    required super.title,
    required super.lang,
    required this.contents,
    required super.parents,
    required this.wholeValue,
    super.isFirst = false,
  });

  final YamlMap contents;

  final Map<String, dynamic> wholeValue;

  String get capitalizedFullTitle {
    return [...parents, title].map(capitalize).join('');
  }

  @override
  String get interfaceStart => '''
    abstract interface class $capitalizedFullTitle {
      T getContent<T>(String key);
  ''';

  @override
  String get start => '''
    class $lang$capitalizedFullTitle implements $capitalizedFullTitle {
      Map<String, Object?> get _contentMap => {
  ''';

  void _generate() {
    final List<MapEntry> entries = contents.entries.toList();
    for (MapEntry<dynamic, dynamic> entry in entries) {
      final String code = entry.key as String;
      final dynamic value = entry.value;
      addMessageToLocalizationContentTemplate(value, code, this, wholeValue);
    }
  }

  @override
  String toString() {
    _generate();
    String result = namespaces;
    if (isFirst) {
      result += interfaceStart + interface + end;
    }
    interfaces.add(capitalizedFullTitle);
    return result + start + contentMap + contentMapEnd + contentMapGetter + messages + end;
  }
}
