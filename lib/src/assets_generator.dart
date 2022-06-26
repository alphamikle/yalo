import 'package:yalo/src/directory_reader.dart';
import 'package:yalo/src/utils/assets_scanner.dart';

const kAssetsEnum = 'Asset';
const kAssetsEnumMap = '_assetEnumMap';

/// Generator for user classes, annotated with @AstHelp
class AssetsGenerator with DirectoryReader {
  final Set<String> _assetsFiles = {};
  final Set<String> _assetsFields = {};
  late AssetsScanner scanner;
  final Set<String> _preloadMimes = {
    'txt',
    'json',
    'yaml',
    'yml',
    // add more
  };

  String template = '';

  String get dependencies => '''
  import 'package:flutter/services.dart';
  ''';

  String get libExporter => '''
library yalo_assets;

export 'src/assets.dart';
  ''';

  /// Returns assets mixin start
  String _startClass(String title) {
    return 'class $title {\n';
  }

  String _replaceSlash(String assetField) {
    return assetField.replaceAll('/', '_').replaceAll(' ', '_');
  }

  String _replaceDash(String assetField) {
    return assetField.replaceAll('-', '_');
  }

  String _replaceExtension(String assetField) {
    return assetField.replaceAll(RegExp(r'\.[a-zA-Z\d]+$'), '');
  }

  String _replaceUnderscore(String assetField) {
    assetField = assetField
        .replaceAllMapped(RegExp(r'_([a-zA-Z\d])'), (Match match) => match.group(1)!.toUpperCase())
        .replaceAll('_', '');
    return assetField.replaceAllMapped(RegExp(r'^([A-Z])'), (Match match) => match.group(1)!.toLowerCase());
  }

  String _replaceDot(String assetField) {
    assetField = assetField
        .replaceAllMapped(RegExp(r'\.([a-zA-Z\d])'), (Match match) => match.group(1)!.toUpperCase())
        .replaceAll('.', '');
    return assetField.replaceAllMapped(RegExp(r'^([A-Z])'), (Match match) => match.group(1)!.toLowerCase());
  }

  /// Replace invalid dart variable names for correct with prefix asset...
  String _checkForInvalidFieldName(String assetField) {
    if (!assetField.contains(RegExp(r'^[a-z_$]'))) {
      assetField = 'asset$assetField';
    }
    return assetField;
  }

  /// Check for same file name in several files in different dirs
  String _checkForCopy(String assetField, String assetFileName) {
    if (_assetsFields.contains(assetField) && !_assetsFiles.contains(assetFileName)) {
      assetField += 'Copy';
      return _checkForCopy(assetField, assetFileName);
    }
    return assetField;
  }

  /// Add an asset mixin field with an asset full path and short name
  String _getClassField(String preparedField) {
    return 'String get $preparedField => ${preparedField}S;\n';
  }

  String _prepareClassField(String assetFileName) {
    String assetField = getOnlyAssetFileName(assetFileName);
    assetField = _replaceSlash(assetField);
    assetField = _replaceDash(assetField);
    assetField = _replaceExtension(assetField);
    assetField = _replaceUnderscore(assetField);
    assetField = _replaceDot(assetField);
    assetField = _checkForInvalidFieldName(assetField);
    assetField = _checkForCopy(assetField, assetFileName);
    _assetsFields.add(assetField);
    _assetsFiles.add(assetFileName);
    return assetField;
  }

  String _getAssetStaticField(String assetFileName, String preparedField) {
    return 'static const String ${preparedField}S = \'$assetFileName\';\n';
  }

  String _startEnum() {
    return '''enum $kAssetsEnum {
      _stub,
    ''';
  }

  String _closeEnum(String assetEnum) {
    return '$assetEnum\n}\n';
  }

  String _startEnumMap() {
    return '\nfinal Map<$kAssetsEnum, String> $kAssetsEnumMap = {\n';
  }

  String _addToEnumMap(String enumField, String assetFileName) {
    final String fieldName = RegExp(r'^([a-zA-Z\d]+)').firstMatch(enumField)!.group(1)!;
    return '$kAssetsEnum.$fieldName: \'$assetFileName\',\n';
  }

  String _closeEnumMap(String enumMap) {
    return '$enumMap\n};\n\n';
  }

  /// Generate preload assets function
  String _preloadAssets() {
    return '''
    final Map<$kAssetsEnum, String> _preloadedAssets = Map();
    bool isPreloaded = false;
    Future<bool> preloadAssets() async {
      final List<Future> loaders = [];
      loadAsset($kAssetsEnum asset) async {        
        final String assetContent = await rootBundle.loadString($kAssetsEnumMap[asset]!, cache: false);
        _preloadedAssets[asset] = assetContent;
      }
      for ($kAssetsEnum assetEnumField in $kAssetsEnum.values) {
        loaders.add(loadAsset(assetEnumField));
      }
      await Future.wait<void>(loaders);
      isPreloaded = true;
      return isPreloaded;
    }
    String getAssetData($kAssetsEnum assetEnum) {
      if (!isPreloaded) {
        throw Exception('You should run method "preloadAssets" before accessing data with "getAssetData" method');
      }
      return _preloadedAssets[assetEnum]!;
    }''';
  }

  String _endClass(String mixin) {
    return '$mixin\n}';
  }

  void generate() {
    scanner = AssetsScanner();
    scanAssets(scanner);
    template = _startClass('Assets');
    final Set<String> tempAssetsFiles = getAssetDirectoryFiles();
    String assetEnum = _startEnum();
    String enumMap = _startEnumMap();
    for (String assetFile in tempAssetsFiles) {
      final String preparedField = _prepareClassField(assetFile);
      final String fieldName = _getClassField(preparedField);
      final String staticFieldName = _getAssetStaticField(assetFile, preparedField);
      if (_preloadMimes.any((String mime) => assetFile.contains(RegExp('\.$mime\$')))) {
        assetEnum += '$preparedField,\n';
        enumMap += _addToEnumMap(preparedField, assetFile);
      }
      template += fieldName;
      template += staticFieldName;
    }
    enumMap = _closeEnumMap(enumMap);
    assetEnum = _closeEnum(assetEnum);
    template += _preloadAssets();
    if (_assetsFiles.isEmpty) {
      template += '// Not found any asset file in assets folder';
    }
    template = _endClass(template);
    template = dependencies + assetEnum + enumMap + template;
    _assetsFiles.clear();
    _assetsFields.clear();
  }
}
