import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/templates/namespace_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

typedef Lang = String;

abstract class LocalizationContentTemplate {
  LocalizationContentTemplate({
    required this.title,
    required this.lang,
    required this.isFirst,
    required this.parents,
  });

  final Map<Lang, Map<String, dynamic>> _wholeValueCache = {};

  final String title;

  final List<String> parents;

  final String lang;

  final bool isFirst;

  final Set<String> interfaces = {};

  String get interfaceStart;

  String get start;

  String get end => '''
    }
  ''';

  String messages = '';

  String interface = '';

  String namespaces = '';

  String contentMap = '';

  String get contentMapEnd => '''
    };

  ''';

  String get contentMapGetter => '''
    @override
    T getContent<T>(String key) {
      final Object? content = _contentMap[key];
      if (content is T) {
        return content;
      }
      throw Exception('Not found correct content of type "\$T" by key "\$key"');
    }
  ''';

  void addSimpleMessage(String code, String value, [String desc = '']) {
    messages += getSimpleValue(code, value.trim(), desc);
    contentMap += _getContentMapValue(code);
    interface += getValueInterface(code, value.trim());
  }

  void addComplexMessage(String code, YamlMap value, Map<String, dynamic> wholeValue) {
    if (value[kValue] != null) {
      addSimpleMessage(code, value[kValue], value[kDesc] ?? '');
    } else if (value[kZero] != null) {
      _addPluralMessage(
        code,
        zero: value[kZero],
        one: value[kOne],
        two: value[kTwo],
        few: value[kFew],
        many: value[kMany],
        other: value[kOther],
        desc: value[kDesc] ?? '',
      );
    } else {
      _addNamespaceMessage(code, lang, value, wholeValue);
    }
  }

  void _addPluralMessage(
    String code, {
    String? zero,
    String? one,
    String? two,
    String? few,
    String? many,
    String? other,
    String desc = '',
  }) {
    messages += getPluralValue(code, zero: zero, one: one, two: two, few: few, many: many, other: other, desc: desc);
    contentMap += _getContentMapValue(code);
    interface += getValueInterface(
      code,
      [
        zero ?? '',
        one ?? '',
        two ?? '',
        few ?? '',
        many ?? '',
        other ?? '',
      ].join(', '),
      isPlural: true,
    );
  }

  void _addNamespaceMessage(String code, String lang, YamlMap value, Map<String, dynamic> wholeValue) {
    log('Whole value: $wholeValue', name: 'DEBUGGER');

    final NamespaceTemplate namespaceTemplate = NamespaceTemplate(
      title: code,
      contents: value,
      lang: lang,
      isFirst: isFirst,
      parents: [title.toLowerCase() == lang.toLowerCase() ? '' : title],
      wholeValue: wholeValue,
    );
    namespaces += namespaceTemplate.toString();
    interfaces.addAll(namespaceTemplate.interfaces);
    interface += getNamespaceInterface(code, lang, title);
    messages += getNamespaceValue(code, lang, lang.toLowerCase() == title.toLowerCase() ? '' : title);
    contentMap += _getContentMapValue(code);
  }

  String _getContentMapValue(String code) {
    return '''
      '$code': $code,
    ''';
  }

  @override
  String toString() => throw UnimplementedError();
}
