import 'package:yalo/src/constants/language_template_constants.dart';
import 'package:yalo/src/templates/localization_content_template.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

RegExp get _substitutionRegExp => RegExp(r'\$\{\w+\}');

void _nullException(String? value, [String name = kCode]) {
  if (value == null) {
    throw ArgumentError.notNull(name);
  }
}

void _emptyException(String value, [String name = kCode]) {
  if (value.isEmpty) {
    throw ArgumentError.value(value, name, '$name must not been empty');
  }
}

bool _hasSubstitution(String value) {
  return _substitutionRegExp.hasMatch(value);
}

String? _replaceNumericPattern(String? value) {
  if (value == null) {
    return null;
  }
  if (value.isEmpty) {
    return '';
  }
  const String pattern = r'${howMany}';
  if (value.contains(pattern)) {
    final replacedValue = value.replaceAll(pattern, '\$$kHowMany');
    return replacedValue;
  }
  return value;
}

String _generateArgumentsFromValue(String value) {
  final Iterable<RegExpMatch> matches = _substitutionRegExp.allMatches(value);
  String arguments = '';

  for (final RegExpMatch match in matches) {
    arguments += 'required String ${match.group(0).toString().replaceAll(RegExp(r'^\$\{|\}$'), '')}, ';
  }
  return '{$arguments}';
}

String getValueInterface(String code, String value, [bool isPlural = false]) {
  if (isPlural) {
    return '''
      String $code(int $kHowMany);
    ''';
  }
  if (_hasSubstitution(value)) {
    return '''
    String $code(${_generateArgumentsFromValue(value)});
    ''';
  }
  return '''
    String get $code;
  ''';
}

String getSimpleValue(String code, String value, [String desc = '']) {
  _nullException(code, kCode);
  _emptyException(code, kCode);
  _nullException(value, kValue);

  if (_hasSubstitution(value)) {
    return '''
      /// Description: "$desc"
      /// Example: "$value"
      @override
      String $code(${_generateArgumentsFromValue(value)}) => Intl.message('$value', name: '$code', desc: '$desc',);
    ''';
  }

  return '''
    /// Description: "$desc"
    /// Example: "$value"
    @override
    final String $code = Intl.message('$value', name: '$code', desc: '$desc');
  ''';
}

String getPluralValue(
  String code, {
  String? zero,
  String? one,
  String? two,
  String? few,
  String? many,
  String? other,
  String? desc,
}) {
  _nullException(code, kCode);
  _nullException(zero, kZero);
  _nullException(one, kOne);
  _nullException(other, kOther);
  _emptyException(code, kCode);

  zero = _replaceNumericPattern(zero);
  other = _replaceNumericPattern(other);
  one = _replaceNumericPattern(one);

  two = _replaceNumericPattern(two) ?? other;
  few = _replaceNumericPattern(two) ?? other;
  many = _replaceNumericPattern(many) ?? other;

  return '''
    /// Description: "$desc"
    /// Example: "zero: $zero, one: $one, two: $two, few: $few, many: $many, other: $other"
    @override
    String $code(int $kHowMany) => Intl.plural($kHowMany,
      name: '$code',
      zero: '$zero',
      one: '$one',
      two: '$two',
      few: '$few',
      many: '$many',
      other: '$other',
      desc: '$desc',
    );
  ''';
}

String getNamespaceInterface(String code, String lang, String parent) {
  final parentName = capitalize(parent);
  final fieldName = capitalize(code);
  final clearFieldName = (parentName + fieldName).replaceFirst(lang, '');
  return '''
    $clearFieldName get $code;
  ''';
}

String getNamespaceValue(String code, String lang, String parent) {
  final parentName = capitalize(parent);
  final fieldName = capitalize(code);
  return '''
    @override
    final $parentName$fieldName $code = $lang$parentName$fieldName();
  ''';
}

void addMessageToLocalizationContentTemplate(dynamic value, String code, LocalizationContentTemplate template) {
  if (value is String || value is num) {
    template.addSimpleMessage(code, value as String);
  } else if (value is YamlMap) {
    template.addMapMessage(code, value);
  } else {
    throw Exception('Invalid format of message. Value: $value, key: $code, type: ${value.runtimeType}');
  }
}
