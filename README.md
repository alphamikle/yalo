# yalo - YAml LOcalizations and assets code generator

## Getting Started

This package is a continuation of the [assets_codegen](https://pub.dev/packages/assets_codegen) package, but with a simpler and more hassle-free form of use.

The main idea of this package is a generating dart class with fields, which can help you access to your assets in code and give you autocomplete and static preload of text assets in one place. *For an example of usage, please see example project.* And to simples generation of localizations from yaml files.

---

### Localization

After installing this package you can use `.yaml` files with localized content. You can place these files in this order:

- .../language_code/intl.yaml
- .../language_code.intl.yaml
- .../language_code_intl.yaml

Where `language_code` is a ru / en / de etc. Like in example:

- assets/localizations/ru/intl.yaml
- assets/localizations/en/intl.yaml
- assets/localizations/de_intl.yaml
- assets/localizations/zh.intl.yaml

These localization files should be in according to format:

```yaml
# .../en/intl.yaml

# Simple key and it localized value
ok: OK

# Value with description
# this type of localized key will has a description on generated code
save:
  # localized value place in value
  value: Save
  # description of value place in desc
  desc: Saving something

# pluralization example
# you can simply use plurals with mark key: and plural forms values
book:
  # zero plural form
  zero: books
  # one plural form
  one: book
  # two plural form and etc.
  two: books
  other: books
  desc: Uses for description of books count

# this is a namespace
namespacedZone:
  # to get localized value of title key you should use a loc.namespacedZone.title
  title: Title of Namespaced zone
  description: Description of Namespaced zone
  # inner namespace
  checkout:
    # loc.namespacedZone.checkout.title
    title: Checkoout for additional page
  innerNamespacedZone:
    title: Deeper title of Inner namespaced zone
    description: Deeper description of Inner namespaced zone
    # plural in inner namespace
    book:
      zero: books
      one: book
      two: books
      few: books
      many: books
      other: books
      desc: Uses for description of books count

cart:
  title: Cart
  description: Please, fill the cart to do checkout
  checkout:
    title: Checkout
    description: You should checkout
```

When you create all localization files - run command:

```bash
flutter pub run yalo:loc
```

This command will generate a `.yalo_locale` folder in your project's root directory. Then, add this folder as a dependency to `pubspec.yaml` file:

```yaml
# ...
dependencies:
  # ...
  yalo_locale:
    path: ./.yalo_locale
  # ...
# ...
```

Now, you can use generated locale delegate in your app! Yalo provides to use a simple variable `localizationsDelegates`, which you can use in your `MaterialApp` or `CupertinoApp`. And also, you can use generated variable `supportedLocales`, which contains all your locales.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // final localizationsDelegates = [LocalizationDelegate(), ...GlobalMaterialLocalizations.delegates];
      localizationsDelegates: localizationsDelegates, // <--
      // const supportedLocales = [const Locale('de'), const Locale('ru'), const Locale('zh'), const Locale('en')];
      supportedLocales: supportedLocales, // <--
      title: 'Assets demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
```

To get access to current locale content, use `Messages.of(context)`, this method will return your current's locale content:

```dart
import 'package:yalo_locale/lib.dart';

// MyHomePageState.dart
@override
  Widget build(BuildContext context) {
    final LocalizationMessages _loc = Messages.of(context); // <-- getting Messages

    return Scaffold(
      appBar: AppBar(
        title: Text('${Messages.of(context).book(3)} app'), // <-- plural using example
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildText('You have $_counter ${_loc.book(_counter)}'),
            _buildText('Namespaced title: ${_loc.namespacedZone.title}'),
            _buildText('Checkout from one namespace: ${_loc.namespacedZone.checkout.title}'),
            _buildText('Checkout from other namespace: ${_loc.cart.checkout.title}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
```

Also, you can use a static fields of `Messages` with localized content too. For every language will be generated a static field. For example:

```dart
class Messages {
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

  // For every language - static field
  static LocalizationMessages get de => LocalizationDelegate()._languageMap['de']; // <--

  static LocalizationMessages get ru => LocalizationDelegate()._languageMap['ru']; // <--

  static LocalizationMessages get zh => LocalizationDelegate()._languageMap['zh']; // <--

  static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']; // <--
}
```

---

### Assets

To generate code with your assets paths, you should run this commend:

```bash
flutter pub run yalo:asset
```

This command will generate a `.yalo_assets` folder in your project's root. Also, as written above, you must add this folder as a dependency of your project:

```yaml
# ...
dependencies:
  # ...
  yalo_assets:
    path: ./.yalo_assets
  # ...
# ...
```

After that, you can use `Assets` class with static and usual fields in your project:

```dart
import 'package:yalo_assets/lib.dart';

// MyHomePageState.dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildText('Assets example: ${Assets.rigDemoS}'), // <-- this static field contains "assets/rive/Rig Demo.flr2d" string
            _buildText('Assets example: ${Assets().rigDemo}'), // <-- this field contains "assets/rive/Rig Demo.flr2d" string
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
```