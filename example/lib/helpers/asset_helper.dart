import 'package:assets_annotations/assets_annotations.dart';
import 'package:flutter/services.dart';

part 'asset_helper.g.dart';

@AstHelp()
class AssetHelper with _$AssetHelper {}

final AssetHelper helper = AssetHelper();

Future<void> useHelper() async {
  await helper.preloadAssets();
  final String assetData = helper.getAssetData(Asset.second);
  final String rig = helper.rigDemo;
}
