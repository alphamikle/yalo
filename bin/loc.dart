import 'package:yalo/src/locale_generator.dart';
import 'package:yalo/src/locale_saver.dart';

Future<void> main() async {
  final LocaleGenerator generator = LocaleGenerator();
  generator.generate();
  LocaleSaver().save(generator);
  print('''
=============================================
LOCALIZATION DELEGATE GENERATION COMPLETE
LANGUAGES: [${generator.languagesCodes.join(', ')}]
=============================================
  ''');
}
