import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/locale_saver.dart';

void main() {
  group('Localization generator of example app I', () {
    test('Test of localization generation', () async {
      final LocaleGenerator generator = LocaleGenerator([]);
      generator.generate();
      final LocaleOutput content = LocaleSaver().save(generator);

      final File exampleFile = File(path.join(path.current, 'test', 'localization_generator_example.dart.template'));
      final File outputFile = File(path.join(path.current, 'test', 'localization_generator_output.dart.template'));
      final File checkFile = File(path.join(path.current, 'test', 'localization_generator_output.dart'));
      outputFile.writeAsStringSync(content.localizationFile);
      checkFile.writeAsStringSync(content.localizationFile);

      expect(outputFile.readAsStringSync(), exampleFile.readAsStringSync());
    });
  });
}
