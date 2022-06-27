import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yalo/src/constants/common_constants.dart';
import 'package:yalo/src/directory_reader.dart';
import 'package:yalo/src/templates/intl_template.dart';
import 'package:yalo/src/templates/language_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yalo/src/utils/assets_scanner.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

class LocaleGenerator with DirectoryReader {
  LocaleGenerator(List<String> pathsToIntlFiles) : _customIntlFiles = Set.from(pathsToIntlFiles);

  final Set<String> _customIntlFiles;
  final Set<String> _intlFiles = {};
  final Set<String> _assetsFiles = {};
  late AssetsScanner scanner;

  late IntlTemplate _intlTemplate;
  final Map<String, LanguageTemplate> _languages = {};
  late String _intlFilesPrefix;

  List<String> get languagesCodes => _languages.keys.toList();

  String get localizationCode => _intlTemplate.template;

  String get libraryCode => '''
  library yalo_locale;

  export 'src/locale.dart' show Messages, $kInterfaceName, localizationsDelegates, supportedLocales;
  ''';

  void generate() {
    scanner = AssetsScanner();
    scanAssets(scanner);
    _intlTemplate = IntlTemplate('LocalizationDelegate');
    _intlFilesPrefix = 'intl';
    _searchIntlFiles();
    _readIntlFiles();
  }

  // TODO(alphamikle): Check is RegExp valid
  bool _isIntlFile(String fileName) => fileName.contains(RegExp('$_intlFilesPrefix.ya?ml\$'));

  void _searchIntlFiles() {
    _intlFiles.clear();
    _assetsFiles.clear();
    _assetsFiles.addAll(getAssetDirectoryFiles());
    for (String assetFile in _assetsFiles) {
      if (_isIntlFile(assetFile)) {
        _intlFiles.add(assetFile);
      }
    }
    _intlFiles.addAll(_customIntlFiles);
  }

  String _getLanguageCode(String originalFileName) {
    // TODO(alphamikle): Check is RegExp valid
    final RegExp regExp = RegExp('/([a-z]+)/?.?($_intlFilesPrefix).ya?ml\$');
    final RegExpMatch? match = regExp.firstMatch(originalFileName);
    if (match == null) {
      return 'en';
    }
    return match.group(1)!;
  }

  void _readIntlFiles() {
    _languages.clear();
    bool isFirst = true;
    for (String intlFile in _intlFiles) {
      final File file = File(p.join(path, intlFile));
      YamlMap fileContent = loadYaml(file.readAsStringSync());
      List<MapEntry<dynamic, dynamic>> entries = fileContent.entries.toList();
      final String languageCode = _getLanguageCode(intlFile);
      final LanguageTemplate languageTemplate = LanguageTemplate(capitalize(languageCode), isFirst);
      for (MapEntry<dynamic, dynamic> entry in entries) {
        _writeMessage(entry, languageTemplate);
      }
      _languages[languageCode] = languageTemplate;
      _intlTemplate.addLanguage(languageCode, languageTemplate);
      isFirst = false;
    }
  }

  void _writeMessage(MapEntry<dynamic, dynamic> entry, LanguageTemplate template) {
    final String code = entry.key as String;
    final dynamic value = entry.value;
    addMessageToLocalizationContentTemplate(value, code, template);
  }
}
