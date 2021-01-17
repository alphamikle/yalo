import 'package:yalo/src/assets_generator.dart';
import 'package:yalo/src/assets_saver.dart';

Future<void> main() async {
  final AssetsGenerator generator = AssetsGenerator();
  generator.generate();
  AssetsSaver().save(generator);
  print('''
=============================================
ASSETS HELPER GENERATION COMPLETE
=============================================
  ''');
}
