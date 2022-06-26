import 'package:yalo/src/constants/language_template_constants.dart';
import 'package:yalo/src/templates/namespace_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yaml/yaml.dart';

abstract class LocalizationContentTemplate {
  LocalizationContentTemplate(this.title, this.lang, this.isFirst);

  final String title;

  final String lang;

  final bool isFirst;

  String get interfaceStart => throw UnimplementedError();

  String get start => throw UnimplementedError();

  String get end => '''
    }
  ''';

  String messages = '';

  String interface = '';

  String namespaces = '';

  void addSimpleMessage(String code, String value, [String desc = '']) {
    messages += getSimpleValue(code, value, desc);
    interface += getValueInterface(code);
  }

  void _addPluralMessage(String code,
      {String? zero, String? one, String? two, String? few, String? many, String? other, String? desc}) {
    messages += getPluralValue(code, zero: zero, one: one, two: two, few: few, many: many, other: other, desc: desc);
    interface += getValueInterface(code, true);
  }

  void _addNamespaceMessage(String code, String lang) {
    messages += getNamespaceValue(code, lang, lang.toLowerCase() == title.toLowerCase() ? '' : title);
  }

  void addMapMessage(String code, YamlMap value) {
    if (value[kValue] != null) {
      addSimpleMessage(code, value[kValue], value[kDesc] ?? '');
      return;
    } else if (value[kZero] != null) {
      _addPluralMessage(code,
          zero: value[kZero],
          one: value[kOne],
          two: value[kTwo],
          few: value[kFew],
          many: value[kMany],
          other: value[kOther],
          desc: value[kDesc]);
    } else {
      namespaces += NamespaceTemplate(
              title: code,
              contents: value,
              lang: lang,
              isFirst: isFirst,
              parent: title.toLowerCase() == lang.toLowerCase() ? '' : title)
          .toString();
      interface += getNamespaceInterface(code, lang, title);
      _addNamespaceMessage(code, lang);
    }
  }

  @override
  String toString() => throw UnimplementedError();
}
