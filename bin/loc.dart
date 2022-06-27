import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/locale_saver.dart';
import 'package:yalo/src/utils/utils.dart';

Future<void> main() async {
  final int start = DateTime.now().millisecondsSinceEpoch;
  final LocaleGenerator generator = LocaleGenerator([]);
  generator.generate();
  LocaleSaver().save(generator);
  final double end = (DateTime.now().millisecondsSinceEpoch - start) / 1000;
  log(
    'Localizations generation completed in $end seconds with [${generator.languagesCodes.map((String locale) => '"$locale"').join(', ')}] locales',
    name: kLocalizationGeneratorLogPrefix,
  );
}
