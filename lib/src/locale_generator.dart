import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yalo/src/constants/constants.dart';
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
  final Set<String> _intlFilesPaths = {};
  final Set<String> _assetsFiles = {};
  late AssetsScanner scanner;

  late IntlTemplate _intlTemplate;
  final Map<String, LanguageTemplate> _languages = {};
  late String _intlFilesPrefix;

  List<String> get languagesCodes => _languages.keys.toList();
  final Set<String> _interfaces = {};

  String get localizationCode => _intlTemplate.template;

  String get _libraryCode => '''
  library yalo_locale;

  export 'src/locale.dart' show Messages, $kInterfaceName, localizationsDelegates, supportedLocales''';

  String generateLibrary() {
    return '$_libraryCode${_interfaces.isEmpty ? '' : ', '}${_interfaces.join(', ')};';
  }

  void generate() {
    scanner = AssetsScanner();
    scanAssets(scanner);
    _intlTemplate = IntlTemplate('LocalizationDelegate');
    _intlFilesPrefix = 'intl';
    _searchIntlFiles();
    _readIntlFiles();
  }

  bool _isIntlFile(String fileName) => fileName.contains(RegExp('$_intlFilesPrefix.ya?ml\$'));

  void _searchIntlFiles() {
    _intlFilesPaths.clear();
    _assetsFiles.clear();
    _assetsFiles.addAll(getAssetDirectoryFiles());
    for (String assetFile in _assetsFiles) {
      if (_isIntlFile(assetFile)) {
        _intlFilesPaths.add(assetFile);
      }
    }
    _intlFilesPaths.addAll(_customIntlFiles);
  }

  String _getLanguageCode(String originalFileName) {
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
    final Map<String, YamlMap> fileContents = {};
    for (final String intlFilePath in _intlFilesPaths) {
      final File file = File(p.join(path, intlFilePath));
      final String fileData = file.readAsStringSync();
      if (fileData.trim().isEmpty) {
        log(
          'File "${file.path}" does not contain any localization data and will be skipped',
          name: kLocalizationGeneratorLogPrefix,
        );
        continue;
      }
      final YamlMap fileContent = loadYaml(fileData);
      fileContents[intlFilePath] = fileContent;
    }
    for (final String intlFilePath in _intlFilesPaths) {
      final YamlMap fileContent = fileContents[intlFilePath]!;
      for (final MapEntry<dynamic, dynamic> entry in fileContent.entries) {
        _replaceLinks(
          entry: entry,
          fileContentKey: intlFilePath,
          fileContents: fileContents,
        );
      }
    }
    for (String intlFilePath in _intlFilesPaths) {
      final YamlMap fileContent = fileContents[intlFilePath]!;
      final List<MapEntry<dynamic, dynamic>> entries = fileContent.entries.toList();
      final String languageCode = _getLanguageCode(intlFilePath);
      final LanguageTemplate languageTemplate = LanguageTemplate(title: capitalize(languageCode), isFirst: isFirst);
      for (MapEntry<dynamic, dynamic> entry in entries) {
        _writeMessage(entry, languageTemplate);
      }
      _interfaces.addAll(languageTemplate.interfaces);
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

  void _replaceLinks({
    required MapEntry<dynamic, dynamic> entry,
    required String fileContentKey,
    required Map<String, YamlMap> fileContents,
  }) {
    final dynamic key = entry.key;
    final dynamic value = entry.value;
    if (value is String) {
      final RegExpMatch? match = RegExp(r'^~(?<language>\w+).(?<key>\w+)$').firstMatch(value);
      if (match != null) {
        final String targetLanguage = match.namedGroup('language')!;
        final String targetKey = match.namedGroup('key')!;
        String? targetFilePath;
        YamlMap? targetFileContent;
        for (final MapEntry<String, YamlMap> entry in fileContents.entries) {
          final RegExp languageRegExp = RegExp('$targetLanguage.?_?');
          if (languageRegExp.hasMatch(entry.key)) {
            targetFilePath = entry.key;
            targetFileContent = entry.value;
          }
        }
        if (targetFileContent == null) {
          throw Exception('Not found target intl file for language "$targetLanguage" with value "$key: $value"');
        }
        final Object? targetValue = targetFileContent[targetKey];
        if (targetValue == null) {
          throw Exception('Not found value with root key "$targetKey" in intl file "$targetFilePath"');
        }
        final Map<dynamic, dynamic> mutableFileContent = Map.fromEntries(fileContents[fileContentKey]!.entries);
        mutableFileContent[targetKey] = targetValue;
        fileContents[fileContentKey] = YamlMap.wrap(mutableFileContent);
      }
    }
  }
}
