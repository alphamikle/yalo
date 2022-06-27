import 'package:flutter/services.dart';

enum Asset {
  _stub,
  second,
  first,
  secondCopy,
  deIntl,
  intl,
  zhIntl,
  intlCopy,
}

final Map<Asset, String> _assetEnumMap = {
  Asset.second: 'assets/second.json',
  Asset.first: 'assets/text/first.txt',
  Asset.secondCopy: 'assets/text/second.txt',
  Asset.deIntl: 'assets/localization/de.intl.yaml',
  Asset.intl: 'assets/localization/ru/intl.yaml',
  Asset.zhIntl: 'assets/localization/zh.intl.yaml',
  Asset.intlCopy: 'assets/localization/en/intl.yaml',
};

class Assets {
  String get second => secondS;
  static const String secondS = 'assets/second.json';
  String get rigDemo => rigDemoS;
  static const String rigDemoS = 'assets/rive/Rig Demo.flr2d';
  String get en => enS;
  static const String enS = 'assets/img/en.png';
  String get ru => ruS;
  static const String ruS = 'assets/img/ru.png';
  String get first => firstS;
  static const String firstS = 'assets/text/first.txt';
  String get secondCopy => secondCopyS;
  static const String secondCopyS = 'assets/text/second.txt';
  String get deIntl => deIntlS;
  static const String deIntlS = 'assets/localization/de.intl.yaml';
  String get intl => intlS;
  static const String intlS = 'assets/localization/ru/intl.yaml';
  String get zhIntl => zhIntlS;
  static const String zhIntlS = 'assets/localization/zh.intl.yaml';
  String get intlCopy => intlCopyS;
  static const String intlCopyS = 'assets/localization/en/intl.yaml';
  final Map<Asset, String> _preloadedAssets = Map();
  bool isPreloaded = false;
  Future<bool> preloadAssets() async {
    final List<Future> loaders = [];
    loadAsset(Asset asset) async {
      final String assetContent = await rootBundle.loadString(_assetEnumMap[asset]!, cache: false);
      _preloadedAssets[asset] = assetContent;
    }

    for (Asset assetEnumField in Asset.values) {
      loaders.add(loadAsset(assetEnumField));
    }
    await Future.wait<void>(loaders);
    isPreloaded = true;
    return isPreloaded;
  }

  String getAssetData(Asset assetEnum) {
    if (!isPreloaded) {
      throw Exception('You should run method "preloadAssets" before accessing data with "getAssetData" method');
    }
    return _preloadedAssets[assetEnum]!;
  }
}
