import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:yalo/src/assets_generator.dart';
import 'package:yalo/src/templates/assets_pubspec_template.dart';

class AssetsSaver {
  String packageName;
  String dartSdk;
  String packagePath;
  AssetsGenerator generator;

  void save(AssetsGenerator generator) {
    this.generator = generator;
    initPackageSettings();
    final Directory dir = Directory(packagePath);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    final String libPath = path.join(packagePath, 'lib');
    final Directory libDir = Directory(libPath);
    if (!libDir.existsSync()) {
      libDir.createSync(recursive: true);
    }
    final File localeFile = File(path.join(libPath, 'assets.dart'));
    localeFile.writeAsStringSync(generator.template);
    final File libFile = File(path.join(libPath, 'lib.dart'));
    libFile.writeAsStringSync(generator.libExporter);
    final File pubspecFile = File(path.join(packagePath, 'pubspec.yaml'));
    pubspecFile.writeAsStringSync(assetsPubspecTemplate(packageName, dartSdk));
  }

  void initPackageSettings() {
    packageName = 'yalo_assets';
    dartSdk = generator.scanner.dartSdk ?? '>=2.7.0';
    packagePath = path.join(generator.path, '.$packageName');
  }
}
