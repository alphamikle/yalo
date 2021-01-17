import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/templates/locale_pubspec_template.dart';

class LocaleSaver {
  String packageName;
  String dartSdk;
  String intlVersion;
  String packagePath;
  LocaleGenerator generator;

  void save(LocaleGenerator generator) {
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
    final String srcPath = path.join(libPath, 'src');
    final Directory srcDir = Directory(srcPath);
    if (!srcDir.existsSync()) {
      srcDir.createSync(recursive: true);
    }
    final File localeFile = File(path.join(srcPath, 'locale.dart'));
    localeFile.writeAsStringSync(generator.template);
    final File libFile = File(path.join(libPath, 'lib.dart'));
    libFile.writeAsStringSync(generator.libExporter);
    final File pubspecFile = File(path.join(packagePath, 'pubspec.yaml'));
    pubspecFile.writeAsStringSync(localePubspecTemplate(packageName, dartSdk, intlVersion));
  }

  void initPackageSettings() {
    packageName = 'yalo_locale';
    dartSdk = generator.scanner.dartSdk ?? '>=2.7.0';
    intlVersion = generator.scanner.intlVersion ?? '0.16.1';
    packagePath = path.join(generator.path, '.$packageName');
  }
}
