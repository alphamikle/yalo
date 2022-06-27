import 'package:yalo/src/assets_generator.dart';
import 'package:yalo/src/assets_saver.dart';
import 'package:yalo/src/constants/constants.dart';
import 'package:yalo/src/utils/utils.dart';

Future<void> main() async {
  final int start = DateTime.now().millisecondsSinceEpoch;
  final AssetsGenerator generator = AssetsGenerator();
  generator.generate();
  AssetsSaver().save(generator);
  final double end = (DateTime.now().millisecondsSinceEpoch - start) / 1000;
  log('Assets generation completed in $end seconds', name: kAssetsGeneratorLogPrefix);
}
