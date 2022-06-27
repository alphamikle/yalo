import 'package:yalo/src/templates/localization_content_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

class NamespaceTemplate extends LocalizationContentTemplate {
  NamespaceTemplate({
    required String title,
    required String lang,
    required this.contents,
    this.parent = '',
    bool isFirst = false,
  }) : super(title, lang, isFirst);

  final YamlMap contents;

  final String parent;

  String get capitalizedTitle => capitalize(title);
  String get capitalizedFullTitle => capitalize(parent) + capitalizedTitle;

  @override
  String get interfaceStart => '''
    abstract class $capitalizedFullTitle {
  ''';

  @override
  String get start => '''
    class $lang$capitalizedFullTitle extends $capitalizedFullTitle {
  ''';

  void _generate() {
    final List<MapEntry> entries = contents.entries.toList();
    for (MapEntry<dynamic, dynamic> entry in entries) {
      final String code = entry.key as String;
      final dynamic value = entry.value;
      addMessageToLocalizationContentTemplate(value, code, this);
    }
  }

  @override
  String toString() {
    _generate();
    String result = namespaces;
    if (isFirst) {
      result += interfaceStart + interface + end;
    }
    return result + start + messages + end;
  }
}
