import 'package:yalo/src/constants/common_constants.dart';
import 'package:yalo/src/templates/language_template.dart';

class IntlTemplate {
  IntlTemplate(this._title);

  final String _title;

  String _templateMapBody = '';

  String _languageClasses = '';

  String get _dependencies => '''
  import 'package:flutter_localizations/flutter_localizations.dart';
  import 'package:flutter/widgets.dart';
  import 'package:intl/intl.dart';

  ''';

  String get _templatesMapStart => '''
  final Map<String, $kInterfaceName> _languageMap = {
  ''';

  String get _templatesMapEnd => '''
  };\n
  ''';

  String get _start => '''
  class $_title extends LocalizationsDelegate<$kInterfaceName> {
    @override
    bool isSupported(Locale locale) => _languageMap.keys.contains(locale.languageCode);
  
    @override
    Future<$kInterfaceName> load(Locale locale) async {
      Intl.defaultLocale = locale.countryCode == null ? locale.languageCode : locale.toString();
      return _languageMap[locale.languageCode]!;
    }
    
    @override
    bool shouldReload(LocalizationsDelegate<$kInterfaceName> old) => false;\n
  ''';

  String get _end => '''
  }\n
  ''';

  String get _messagesUtil => '''  
  class Messages {
    static $kInterfaceName of(BuildContext context) => Localizations.of(context, $kInterfaceName);

    $_staticMethods
  }
  
  final List<LocalizationsDelegate> localizationsDelegates = [$_title(), ...GlobalMaterialLocalizations.delegates];\n
  ''';

  String _staticMethods = '';

  String _supportedLocales = 'const List<Locale> supportedLocales = [\n';

  String get _supportedLocalesEnd => '];';

  String get template {
    return _dependencies +
        _languageClasses +
        _start +
        _templatesMapStart +
        _templateMapBody +
        _templatesMapEnd +
        _end +
        _messagesUtil +
        _supportedLocales +
        _supportedLocalesEnd;
  }

  void addLanguage(String code, LanguageTemplate languageTemplate) {
    _languageClasses += languageTemplate.toString();
    _templateMapBody += '''
    '$code': ${languageTemplate.title}(),
    ''';
    _staticMethods += '''
    static $kInterfaceName get $code => $_title()._languageMap['$code']!;
    ''';
    _supportedLocales += '''
    Locale('$code'),
    ''';
  }
}
