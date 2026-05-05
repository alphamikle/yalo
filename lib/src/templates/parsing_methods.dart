import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/templates/localization_content_template.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

RegExp get _substitutionRegExp => RegExp(r'\$\{(\w+)\}');

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
  final List<RegExpMatch> matches = _substitutionRegExp.allMatches(value).toList();
  return matches.isNotEmpty && matches.any((RegExpMatch match) => match.group(1) != kHowMany);
}

String _generateArgumentsFromValue(String value, {bool isPlural = false}) {
  final Iterable<RegExpMatch> matches = _substitutionRegExp.allMatches(value);
  final Set<String> arguments = {};

  for (final RegExpMatch match in matches) {
    final String argumentName = match.group(0).toString().replaceAll(RegExp(r'^\$\{|\}$'), '');
    if (argumentName == kHowMany) {
      arguments.add('required int $argumentName');
    } else {
      arguments.add('required String $argumentName');
    }
  }
  return '{${arguments.join(', ')},${isPlural ? ' int? precision,' : ''}}';
}

String _removeExtraBraces(String code) {
  return code.replaceAllMapped(RegExp(r'\${(\w+)}'), (Match match) => '\$${match.group(1) ?? ''}');
}

String getValueInterface(String code, String value, {bool isPlural = false}) {
  if (_hasSubstitution(value.trim())) {
    return '''
      String $code(${_generateArgumentsFromValue(value.trim(), isPlural: isPlural)});
    ''';
  }
  if (isPlural) {
    return '''
      String $code(int $kHowMany, {int? precision});
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

  if (_hasSubstitution(value.trim())) {
    return _removeExtraBraces('''
      ${desc.isNotEmpty ? '/// ${desc.trim()}' : ''}
      @override
      String $code(${_generateArgumentsFromValue(value.trim())}) => Intl.message(\'\'\'${value.trim()}\'\'\', name: '$code');
    ''');
  }

  return _removeExtraBraces('''
    ${desc.isNotEmpty ? '/// ${desc.trim()}' : ''}
    @override
    final String $code = Intl.message(\'\'\'${value.trim()}\'\'\', name: '$code');
  ''');
}

String getPluralValue(
  String code, {
  String? zero,
  String? one,
  String? two,
  String? few,
  String? many,
  String? other,
  String desc = '',
}) {
  _nullException(code, kCode);
  _nullException(zero, kZero);
  _nullException(one, kOne);
  _nullException(other, kOther);
  _emptyException(code, kCode);

  if (_hasSubstitution(zero ?? '') ||
      _hasSubstitution(one ?? '') ||
      _hasSubstitution(two ?? '') ||
      _hasSubstitution(few ?? '') ||
      _hasSubstitution(many ?? '') ||
      _hasSubstitution(other ?? '')) {
    return _removeExtraBraces('''
      ${desc.isNotEmpty ? '/// ${desc.trim()}' : ''}
      @override
      String $code(${_generateArgumentsFromValue([
              zero ?? '',
              one ?? '',
              two ?? '',
              few ?? '',
              many ?? '',
              other ?? '',
            ].join(', '), isPlural: true)}) => Intl.plural($kHowMany,
        name: \'\'\'$code\'\'\',
        zero: \'\'\'${zero?.trim()}\'\'\',
        one: \'\'\'${one?.trim()}\'\'\',
        two: \'\'\'${(two ?? other)?.trim()}\'\'\',
        few: \'\'\'${(few ?? other)?.trim()}\'\'\',
        many: \'\'\'${(many ?? other)?.trim()}\'\'\',
        other: \'\'\'${other?.trim()}\'\'\',
        precision: precision,
      );
    ''');
  }

  return _removeExtraBraces('''
      ${desc.isNotEmpty ? '/// ${desc.trim()}' : ''}
    @override
    String $code(int $kHowMany, {int? precision}) => Intl.plural($kHowMany,
      name: \'\'\'$code\'\'\',
      zero: \'\'\'${zero?.trim()}\'\'\',
      one: \'\'\'${one?.trim()}\'\'\',
      two: \'\'\'${(two ?? other)?.trim()}\'\'\',
      few: \'\'\'${(few ?? other)?.trim()}\'\'\',
      many: \'\'\'${(many ?? other)?.trim()}\'\'\',
      other: \'\'\'${other?.trim()}\'\'\',
      precision: precision,
    );
  ''');
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

void addMessageToLocalizationContentTemplate(dynamic value, String code, LocalizationContentTemplate template, List<String> parents) {
  if (value is String || value is num) {
    template.addSimpleMessage(code, value.toString());
  } else if (value is YamlMap) {
    template.addComplexMessage(code, value, parents);
  } else {
    throw Exception('Invalid format of message. Value: $value, key: $code, type: ${value.runtimeType}');
  }
}
