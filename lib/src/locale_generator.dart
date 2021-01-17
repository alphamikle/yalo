import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yalo/src/directory_reader.dart';
import 'package:yalo/src/templates/intl_template.dart';
import 'package:yalo/src/templates/language_template.dart';
import 'package:yalo/src/templates/parsing_methods.dart';
import 'package:yalo/src/utils/assets_scanner.dart';
import 'package:yalo/src/utils/utils.dart';
import 'package:yaml/yaml.dart';

class LocaleGenerator with DirectoryReader {
  final Set<String> _intlFiles = {};
  final Set<String> _assetsFiles = {};
  AssetsScanner scanner;

  IntlTemplate _intlTemplate;
  Map<String, LanguageTemplate> _languages = {};
  String _intlFilesPrefix;

  List<String> get languagesCodes => _languages.keys.toList();

  String get template => _intlTemplate.template;

  String get libExporter => '''library yalo_locale;
export 'locale.dart';
  ''';

  bool isIntlFile(String fileName) => fileName.contains(RegExp('$_intlFilesPrefix\.ya?ml\$'));

  void searchIntlFiles() {
    _intlFiles.clear();
    _assetsFiles.clear();
    _assetsFiles.addAll(getAssetDirectoryFiles());
    for (String assetFile in _assetsFiles) {
      if (isIntlFile(assetFile)) {
        _intlFiles.add(assetFile);
      }
    }
  }

  String getLanguageCode(String originalFileName) {
    final RegExp regExp = RegExp('\/([a-z]+)\/?\.?($_intlFilesPrefix).ya?ml\$');
    final RegExpMatch match = regExp.firstMatch(originalFileName);
    if (match == null) {
      return 'en';
    }
    return match.group(1);
  }

  void readIntlFiles() {
    _languages.clear();
    bool isFirst = true;
    for (String intlFile in _intlFiles) {
      final File file = File(p.join(path, intlFile));
      YamlMap fileContent = loadYaml(file.readAsStringSync());
      List<MapEntry<dynamic, dynamic>> entries = fileContent.entries.toList();
      final String languageCode = getLanguageCode(intlFile);
      final LanguageTemplate languageTemplate = LanguageTemplate(capitalize(languageCode), isFirst);
      for (MapEntry<dynamic, dynamic> entry in entries) {
        writeMessage(entry, languageTemplate);
      }
      _languages[languageCode] = languageTemplate;
      _intlTemplate.addLanguage(languageCode, languageTemplate);
      isFirst = false;
    }
  }

  void writeMessage(MapEntry<dynamic, dynamic> entry, LanguageTemplate template) {
    final String code = entry.key as String;
    final dynamic value = entry.value;
    addMessageToLocalizationContentTemplate(value, code, template);
  }

  void generate() {
    scanner = AssetsScanner();
    scanAssets(scanner);
    _intlTemplate = IntlTemplate('LocalizationDelegate');
    _intlFilesPrefix = 'intl';
    searchIntlFiles();
    readIntlFiles();
  }
}
