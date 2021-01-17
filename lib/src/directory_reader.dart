import 'dart:io';

import 'package:analyzer/dart/element/element.dart' as el;
import 'package:path/path.dart' as p;
import 'package:yalo/src/utils/assets_scanner.dart';
import 'package:yaml/yaml.dart';

mixin DirectoryReader {
  final Map<String, Stream<FileSystemEvent>> _assetsFoldersWatchers = {};

  el.Element prevElement;
  bool isWatchersAssigned = false;
  String path;
  YamlList _assetsFolders;

  final RegExp _diskWord = RegExp(r'^[a-zA-Z]+:');

  String getOnlyAssetFileName(String assetFileNameWithPath) {
    assetFileNameWithPath = assetFileNameWithPath.replaceAll(RegExp(r'\\'), '/');
    assetFileNameWithPath = assetFileNameWithPath.replaceAll(RegExp(r'^.*\/'), '');
    return assetFileNameWithPath;
  }

  void scanAssets(AssetsScanner scanner) {
    path = scanner.path;
    _assetsFolders = scanner.assetsFolders;
  }

  Set<String> getAssetDirectoryFiles() {
    final Set<String> tempAssetsFiles = {};
    for (String assetFolder in _assetsFolders) {
      final String dirPath = p.join(path, assetFolder);
      final Directory assetDirectory = Directory(dirPath);
      if (!_assetsFoldersWatchers.containsKey(dirPath)) {
        _assetsFoldersWatchers[dirPath] = assetDirectory.watch(recursive: true);
      }
      final List<FileSystemEntity> folderFiles = assetDirectory.listSync(recursive: true).where((FileSystemEntity fileEntity) => FileSystemEntity.isFileSync(fileEntity.path)).toList();
      final String unixPath = path.replaceFirst(_diskWord, '').replaceAll(r'\', '/');
      tempAssetsFiles.addAll(folderFiles.map((FileSystemEntity fileEntity) {
        final String unixFilePath = fileEntity.path.replaceFirst(_diskWord, '').replaceAll(r'\', '/');
        final result = unixFilePath.replaceFirst(RegExp('$unixPath/'), '');
        return result;
      }).where((String fileName) => !fileName.contains('/.')));
    }
    return tempAssetsFiles;
  }
}
