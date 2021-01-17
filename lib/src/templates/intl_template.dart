import 'package:yalo/src/constants/common_constants.dart';
import 'package:yalo/src/templates/language_template.dart';

class IntlTemplate {
  IntlTemplate(this._title);

  final String _title;

  String _templateMapBody = '';

  String _languageClasses = '';

  String _dependencies = '''import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

  ''';

  String get _templatesMapStart => '''
  final Map<String, $ABSTRACT_CLASS_NAME> _languageMap = {
  ''';

  String get _templatesMapEnd => '''
  };\n
  ''';

  String get _start => '''
  class $_title extends LocalizationsDelegate<$ABSTRACT_CLASS_NAME> {
    @override
    bool isSupported(Locale locale) => _languageMap.keys.contains(locale.languageCode);
  
    @override
    Future<$ABSTRACT_CLASS_NAME> load(Locale locale) async {
      Intl.defaultLocale = locale.countryCode == null ? locale.languageCode : locale.toString();
      return _languageMap[locale.languageCode];
    }
    
    @override
    bool shouldReload(LocalizationsDelegate<$ABSTRACT_CLASS_NAME> old) => false;\n
  ''';

  String get _end => '''
  }\n
  ''';

  String get _messagesUtil => '''  
  class Messages {
    static $ABSTRACT_CLASS_NAME of(BuildContext context) => Localizations.of(context, $ABSTRACT_CLASS_NAME);

    $_staticMethods
  }
  
  final localeDelegates = [$_title(), ...GlobalMaterialLocalizations.delegates];
  ''';

  String _staticMethods = '';

  String get template {
    return _dependencies + _languageClasses + _start + _templatesMapStart + _templateMapBody + _templatesMapEnd + _end + _messagesUtil;
  }

  void addLanguage(String code, LanguageTemplate languageTemplate) {
    _languageClasses += languageTemplate.toString();
    _templateMapBody += '''
    '$code': _${languageTemplate.title}(),
    ''';
    _staticMethods += '''
static $ABSTRACT_CLASS_NAME get $code => $_title()._languageMap['$code'];
    ''';
  }
}
