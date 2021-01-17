String assetsPubspecTemplate(String name, String dartSdk) => '''
name: $name
description: Assets of app
version: 1.0.0

environment:
  sdk: "$dartSdk"

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
''';
