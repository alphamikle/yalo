# <span style="color:#3892fa">Ya</span>ml <span style="color:#3892fa">lo</span>calizations (and assets codegen)

## [yalo:loc] How to use

### 1. Localization files

After installing this package you can use `.yaml` files with localization content. You can place these files in this order

- `assets/**/language_code/intl.yaml`
- `assets/**/language_code.intl.yaml`
- `assets/**/language_code_intl.yaml`

Where `language_code` is a `ua` / `en` / `de`, etc. Like in example

- `assets/localizations/ua/intl.yaml`
- `assets/en/intl.yaml`
- `assets/content/de_intl.yaml`
- `assets/zh.intl.yaml`

### 2. Describe path to the assets folder

Of course, you must also specify the path to the assets folder in `pubspec.yaml`

```yaml
# pubspec.yaml
# ...
flutter:
  # ...
  assets:
    - assets/
  # ...
```

### 3. Run the command

When you created all localization files, then run command

```bash
flutter pub run yalo:loc
```

### 4. Add generated localization dependency to your project

This command will generate a `.yalo_locale` folder in your project's root directory. Then, add this package as a dependency to your `pubspec.yaml` file

```yaml
# ...
dependencies:
  # ...
  yalo_locale:
    path: ./.yalo_locale
  # ...
# ...
```

### 5. Use and enjoy

Now you can use generated localization delegate in your app! Yalo provides you to use a simple variable `localizationsDelegates`, which you can use in your `MaterialApp` or `CupertinoApp`. And also,
you can use generated variable `supportedLocales`, which contains all your locales

```dart
import 'package:yalo_locale/lib.dart';

class PresidentsApp extends StatelessWidget {
  const PresidentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      locale: DevicePreview.locale(context),
      onGenerateTitle: (BuildContext context) =>
      Messages
          .of(context)
          .app
          .title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      home: const MyHomePage(),
    );
  }
}
```

To get access to current localization content, use `Messages.of(context)`. This method will return your current's locale content

```dart
Widget build(BuildContext context) {
  final LocalizationMessages loc = Messages.of(context);

  return Scaffold(
    appBar: AppBar(
      title: Text(loc.app.description),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              loc.books(user: loc.presidents.getContent('p$_counter'), howMany: _counter),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: loc.tooltips.increment,
      child: const Icon(Icons.add),
    ),
  );
}
```

Also, you can use a static fields of `Messages` with localized content too. For every language will be generated a static field. For example:

```dart
class Messages {
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

  static LocalizationMessages get de => LocalizationDelegate()._languageMap['de']!;

  static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
}
```

## Localization files format

### 1. Simple message

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

### 2. Simple message with description

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

### 3. Simple message with substitution

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

### 4. Simple message with description and substitution

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

### 5. Plural message

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
String book(int howMany, {int? precision}) =>
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
      precision: precision,
    );
```

### 6. Plural message with using of quantity in the text

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
String people(int howMany, {int? precision}) =>
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
      precision: precision,
    );
```

### 7. Plural message with extra substitution params

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
  int? precision,
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
      precision: precision,
    );
```

### 8. Namespaced content

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
# ...
# [MessagesNamespace]
app:
  # [SimpleMessage]
  title: Yalo app
  # [SimpleMessage]
  description: This app will show you how to use yalo package
```

```dart
/// This is an example of how namespaces works
final String bookTitle = Messages
    .of(context)
    .namespacedZone
    .innerNamespacedZone
    .book(booksQuantity);
final String checkoutTitle = Messages
    .of(context)
    .namespacedZone
    .checkout
    .title;
// ...
final String appTitle = Messages
    .of(context)
    .app
    .title;
```

### 9. Link to another language file

It may happen that some block of content will be the same in all languages. In such a case, you can only define this content in one language and link to it in other languages. For example like this:

```yaml
# en.intl.yaml
presidents:
  p1: George Washington
  p2: John Adams
  p3: Thomas Jefferson
  p4: James Madison
  # ...
```

```yaml
# de.intl.yaml
presidents: ~en.presidents
```

An important note about this feature: at the moment, only first-level (root) elements can be referenced this way.

## Dynamic access

In addition to accessing content in a class style, you can also access it dynamically using the `T getContent<T>(String key)` method of any namespace-class or root `LocalizationMessages` entity. Thus,
you can both move along the chain of class-namespaces, and simply get something dynamically. See here:

```yaml
mainView:
  firstTab:
    secondStory:
      example:
        title: This is a title
        description: This is a description
---
presidents:
  p1: George Washington
  p2: John Adams
  p3: Thomas Jefferson
  p4: James Madison
  # ...
```

```dart

final String title = loc
    .getContent<MainView>('mainView')
    .getContent<MainViewFirstTab>('firstTab')
    .getContent<FirstTabSecondStory>('secondStory')
    .getContent<SecondStoryExample>('example')
    .getContent('title');

final Widget widget = Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: Text(
    loc.books(user: loc.presidents.getContent('p$_counter'), howMany: _counter),
    textAlign: TextAlign.center,
  ),
);
```

## Examples

You can see additional examples of [generated code](./example/.yalo_locale/lib/src/locale.dart), its [usage](./example/lib/main.dart), as well as
localization [source files](./example/assets/localization) in GitHub.

---

### Assets

To generate code with your assets paths, you should run this command:

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