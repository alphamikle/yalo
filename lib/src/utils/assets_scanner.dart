import 'dart:io';

import 'package:yaml/yaml.dart';

const kFlutter = 'flutter';
const kAssets = 'assets';
const kDependencies = 'dependencies';
const kIntl = 'intl';
const kEnv = 'environment';
const kSdk = 'sdk';

class AssetsScanner {
  late Directory _curDir;
  late String _path;
  late List<FileSystemEntity> _files;
  late FileSystemEntity _pubspecEntity;
  late File _pubspecFile;
  late YamlMap _pubspecContent;
  YamlMap? _flutter;
  YamlList? _assetsFolders;

  String get path => _path;

  YamlList get assetsFolders => _assetsFolders!;

  YamlMap? get _dependencies => _pubspecContent[kDependencies];

  String? get intlVersion => _dependencies == null ? null : _dependencies![kIntl];

  String? get dartSdk => _pubspecContent[kEnv][kSdk];

  AssetsScanner() {
    _curDir = Directory.current;
    _path = _curDir.path;
    _files = _curDir.listSync();
    _pubspecEntity = _files.firstWhere(
        (FileSystemEntity fileEntity) => fileEntity.path.contains(RegExp(r'pubspec.ya?ml$')),
        orElse: () => _exception('pubspec file'));
    _pubspecFile = File(_pubspecEntity.path);
    _pubspecContent = loadYaml(_pubspecFile.readAsStringSync());
    _flutter = _pubspecContent[kFlutter];
    if (_flutter == null) {
      _exception('"flutter" section in pubspec');
    }
    _assetsFolders = _flutter![kAssets];
    if (_assetsFolders == null || _assetsFolders!.isEmpty) {
      throw Exception('''
      Not found "assets" block in pubspec.yaml file or this block is empty. Please, add at least a one folder to assets block like that:
      pubspec.yaml
      #...
      flutter:
        #...
      assets: <-- 1
        - assets/ <-- 2
      #...
      ''');
    }
  }

  _exception(String what) {
    throw Exception('Not found $what in $_path directory');
  }
}
