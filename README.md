## <span style="color:#3892fa">Ya</span>ml <span style="color:#3892fa">lo</span>calizations (and assets codegen)

### Localization

After installing this package you can use `.yaml` files with localized content. You can place these files in this order:

- `.../language_code/intl.yaml`
- `.../language_code.intl.yaml`
- `.../language_code_intl.yaml`

Where `language_code` is a `ua` / `en` / `de`, etc. Like in example:

- `assets/localizations/ua/intl.yaml`
- `assets/en/intl.yaml`
- `assets/content/de_intl.yaml`
- `assets/zh.intl.yaml`

#### Localization file's messages

##### 1. Simple message

```yaml
# The simplest possible message type [SimpleMessage]
cancel: Cancel
```

```dart
  /// Description: ""
/// Example: "Cancel"
@override
final String cancel = Intl.message(
  '''Cancel''',
  name: 'cancel',
  desc: '',
);
```

##### 2. Simple message with description

```yaml
# Simple message type with description [SimpleMessage]
save:
  value: Save
  desc: Saving something
```

```dart
/// Description: "Saving something"
/// Example: "Save"
@override
final String save = Intl.message(
  '''Save''',
  name: 'save',
  desc: 'Saving something',
);
```

##### 3. Simple message with substitution

```yaml
# [SimpleMessage] with additional substitution params
greetings: Hello ${userName}! We are glad to see you at our ${hotelName} hotel!
```

```dart
/// Description: ""
/// Example: "Hello $userName! We are glad to see you at our $hotelName hotel!"
@override
String greetings({
  required String userName,
  required String hotelName,
}) =>
    Intl.message(
      '''Hello $userName! We are glad to see you at our $hotelName hotel!''',
      name: 'greetings',
      desc: '',
    );
```

##### 4. Simple message with description and substitution

```yaml
# [SimpleMessage] with description and substitution params
weather:
  value: It's ${temperature} degrees outside today!
  desc: "Title on the main weather screen (see here: https://www.figma.com/community/file/974352831498882628)"
```

```dart
/// Description: "Title on the main weather screen (see here: https://www.figma.com/community/file/974352831498882628)"
/// Example: "It's $temperature degrees outside today!"
@override
String weather({
  required String temperature,
}) =>
    Intl.message(
      '''It's $temperature degrees outside today!''',
      name: 'weather',
      desc: 'Title on the main weather screen (see here: https://www.figma.com/community/file/974352831498882628)',
    );
```

##### 5. Plural message

For additional info about plural rules go [here](https://cldr.unicode.org/index/cldr-spec/plural-rules)

```yaml
# [PluralMessage]
book:
  # Required parameter of plural message
  zero: books
  # Required parameter of plural message
  one: book
  # Optional parameter of plural message
  two: books
  # Optional parameter of plural message
  few: books
  # Optional parameter of plural message
  many: books
  # Required parameter of plural message
  other: books
  # Optional parameter of plural message
  desc: Uses for description of books count
```

```dart
/// Description: "Uses for description of books count"
/// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
@override
String book(int howMany) =>
    Intl.plural(
      howMany,
      name: '''book''',
      zero: '''books''',
      one: '''book''',
      two: '''books''',
      few: '''books''',
      many: '''books''',
      other: '''books''',
      desc: '''Uses for description of books count''',
    );
```

##### 6. Plural message with using of quantity in the text

```yaml
# [PluralMessage]
people:
  zero: I saw no people there
  one: I saw only one man there
  two: I saw two people there
  # Message with substitution of quantity of something
  few: I saw ${howMany} people there
  many: I saw ${howMany} or more people there
  other: I think, I saw ${howMany} people there
  desc: An example with numeric substitution in plural strings
```

```dart
/// Description: "An example with numeric substitution in plural strings"
/// Example: "zero: I saw no people there, one: I saw only one man there, two: I saw two people there, few: I saw $howMany people there, many: I saw $howMany or more people there, other: I think, I saw $howMany people there"
@override
String people(int howMany) =>
    Intl.plural(
      howMany,
      name: '''people''',
      zero: '''I saw no people there''',
      one: '''I saw only one man there''',
      two: '''I saw two people there''',
      few: '''I saw $howMany people there''',
      many: '''I saw $howMany or more people there''',
      other: '''I think, I saw $howMany people there''',
      desc: '''An example with numeric substitution in plural strings''',
    );
```

##### 7. Plural message with extra substitution params

```yaml
# [PluralMessage] with additional substitution params and quantity substitution param
shop:
  zero: There are no any ${shopName} shops
  one: There are exactly one ${shopName} shop
  two: There are two ${shopName} shops
  few: There are ${howMany} ${shopName} shops and we have plans to open additional at the ${city}!
  many: There are ${howMany} shops. Sorry, I didn't remember that shop name.
  other: Well, I tired to count these shops. I can say that there are only ${howMany} shops!
```

```dart
/// Description: ""
/// Example: "zero: There are no any $shopName shops, one: There are exactly one $shopName shop, two: There are two $shopName shops, few: There are $howMany $shopName shops and we have plans to open additional at the $city!, many: There are $howMany shops. Sorry, I didn't remember that shop name., other: Well, I tired to count these shops. I can say that there are only $howMany shops!"
@override
String shop({
  required String shopName,
  required int howMany,
  required String city,
}) =>
    Intl.plural(
      howMany,
      name: '''shop''',
      zero: '''There are no any $shopName shops''',
      one: '''There are exactly one $shopName shop''',
      two: '''There are two $shopName shops''',
      few: '''There are $howMany $shopName shops and we have plans to open additional at the $city!''',
      many: '''There are $howMany shops. Sorry, I didn't remember that shop name.''',
      other: '''Well, I tired to count these shops. I can say that there are only $howMany shops!''',
      desc: '''''',
    );
```

##### 8. Namespaced content

```yaml
# Namespace of group of messages [MessagesNamespace]
namespacedZone:
  # [SimpleMessage]
  title: Title of Namespaced zone
  # [SimpleMessage]
  description: Description of Namespaced zone
  # [MessagesNamespace]
  checkout:
    # [SimpleMessage]
    title: Checkout for additional page
  # [MessagesNamespace]
  innerNamespacedZone:
    # [SimpleMessage]
    title: Deeper title of Inner namespaced zone with name ${name}
    # [SimpleMessage]
    description: Deeper description of Inner namespaced zone
    # [PluralMessage]
    book:
      # Required parameter of plural message
      zero: books
      # Required parameter of plural message
      one: book
      # Optional parameter of plural message
      two: books
      # Optional parameter of plural message
      few: books
      # Optional parameter of plural message
      many: books
      # Required parameter of plural message
      other: books
      # Optional parameter of plural message
      desc: Uses for description of books count
```

```dart
final String bookTitle = Messages.of(context).namespacedZone.innerNamespacedZone.book(booksQuantity);
final String checkoutTitle = Messages.of(context).namespacedZone.checkout.title;
```

Additional `dart` example of namespaced output is available [here](./.yalo_locale/lib/src/locale.dart) (search for `NamespacedZone` or just look for final interface of all localization messages by search `LocalizationMessages`).

#### [Full example](./assets/en_intl.yaml)

When you create all localization files - run command:

```bash
flutter pub run yalo:loc
```

This command will generate a `.yalo_locale` folder in your project's root directory. Then, add this package as a dependency to your `pubspec.yaml` file:

# TODO: Продолжать с этого места, нужно добавить параметр precision в plural-строки, дополнить примеры и доработать example.

```yaml
# ...
dependencies:
  # ...
  yalo_locale:
    path: ./.yalo_locale
  # ...
# ...
```

Now, you can use generated locale delegate in your app! Yalo provides you to use a simple variable `localizationsDelegates`, which you can use in your `MaterialApp` or `CupertinoApp`. And also, you can
use generated variable `supportedLocales`, which contains all your locales.

```dart
import 'package:flutter/material.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates, // <- Imported from locally generated yalo-package
      supportedLocales: supportedLocales, // <- And this too
      onGenerateTitle: (BuildContext context) => Messages.of(context).app.title,
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