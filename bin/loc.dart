import 'dart:developer';

import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/locale_saver.dart';

Future<void> main() async {
  final int start = DateTime.now().millisecondsSinceEpoch;
  final LocaleGenerator generator = LocaleGenerator([]);
  generator.generate();
  LocaleSaver().save(generator);
  final double end = (DateTime.now().millisecondsSinceEpoch - start) / 1000;
  log(
    'Localizations generation completed in $end seconds with ${generator.languagesCodes.join(', ')} locales',
    name: 'LOCALIZATION GENERATOR',
  );
}
