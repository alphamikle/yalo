import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as path;
import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/templates/locale_pubspec_template.dart';
import 'package:yalo/src/utils/utils.dart';

class LocaleOutput {
  const LocaleOutput({
    required this.localizationFile,
    required this.libraryFile,
    required this.pubspecFile,
  });

  final String localizationFile;
  final String libraryFile;
  final String pubspecFile;
}

class LocaleSaver {
  late String packageName;
  late String dartSdk;
  late String intlVersion;
  late String packagePath;
  late LocaleGenerator generator;

  LocaleOutput save(LocaleGenerator generator) {
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
    final File localizationFile = File(path.join(srcPath, 'locale.dart'));
    final DartFormatter formatter = DartFormatter(pageWidth: 120);
    String localizationCode = generator.localizationCode;
    try {
      localizationCode = formatter.format(localizationCode);
    } catch (error, stackTrace) {
      log('Some error was happened when formatting of localizationCode performed\n$error\n$stackTrace', name: kLocalizationGeneratorErrorPrefix);
    }
    localizationFile.writeAsStringSync(localizationCode);
    final File libraryFile = File(path.join(libPath, 'lib.dart'));

    String libraryCode = generator.generateLibrary();
    try {
      libraryCode = formatter.format(libraryCode);
    } catch (error, stackTrace) {
      log('Some error was happened when formatting of libraryCode performed\n$error\n$stackTrace', name: kLocalizationGeneratorErrorPrefix);
    }
    libraryFile.writeAsStringSync(libraryCode);
    final File pubspecFile = File(path.join(packagePath, 'pubspec.yaml'));
    pubspecFile.writeAsStringSync(localePubspecTemplate(packageName, dartSdk, intlVersion));
    return LocaleOutput(
      localizationFile: localizationFile.readAsStringSync(),
      libraryFile: libraryFile.readAsStringSync(),
      pubspecFile: pubspecFile.readAsStringSync(),
    );
  }

  void initPackageSettings() {
    packageName = 'yalo_locale';
    dartSdk = generator.scanner.dartSdk ?? '>=2.17.0';
    intlVersion = generator.scanner.intlVersion ?? '0.17.0';
    packagePath = path.join(generator.path, '.$packageName');
  }
}
