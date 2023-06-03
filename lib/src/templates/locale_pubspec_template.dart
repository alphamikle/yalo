String localePubspecTemplate(String name, String dartSdk, String intlVersion) => '''
name: $name
description: Locale of app
version: 1.0.0

environment:
  sdk: "$dartSdk"

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: $intlVersion
''';
