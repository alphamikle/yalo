import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract interface class CheckoutCheckout {
  T getContent<T>(String key);
  String get title;
}

class EnCheckoutCheckout implements CheckoutCheckout {
  Map<String, Object?> get _contentMap => {
        'title': title,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String title = Intl.message('''Checkout for additional page''', name: 'title');
}

abstract interface class InnerNamespacedZoneInnerNamespacedZone {
  T getContent<T>(String key);
  String title({
    required String name,
  });
  String get description;
  String book(int howMany, {int? precision});
}

class EnInnerNamespacedZoneInnerNamespacedZone implements InnerNamespacedZoneInnerNamespacedZone {
  Map<String, Object?> get _contentMap => {
        'title': title,
        'description': description,
        'book': book,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  String title({
    required String name,
  }) =>
      Intl.message('''Deeper title of Inner namespaced zone with name $name''', name: 'title');

  @override
  final String description = Intl.message('''Deeper description of Inner namespaced zone''', name: 'description');

  /// Uses for description of books count
  @override
  String book(int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: '''book''',
        zero: '''books''',
        one: '''book''',
        two: '''books''',
        few: '''books''',
        many: '''books''',
        other: '''books''',
        precision: precision,
      );
}

abstract interface class NamespacedZoneNamespacedZone {
  T getContent<T>(String key);
  String get title;
  String get description;
  NamespacedZoneCheckout get checkout;
  NamespacedZoneInnerNamespacedZone get innerNamespacedZone;
}

class EnNamespacedZoneNamespacedZone implements NamespacedZoneNamespacedZone {
  Map<String, Object?> get _contentMap => {
        'title': title,
        'description': description,
        'checkout': checkout,
        'innerNamespacedZone': innerNamespacedZone,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String title = Intl.message('''Title of Namespaced zone''', name: 'title');

  @override
  final String description = Intl.message('''Description of Namespaced zone''', name: 'description');
  @override
  final NamespacedZoneCheckout checkout = EnNamespacedZoneCheckout();
  @override
  final NamespacedZoneInnerNamespacedZone innerNamespacedZone = EnNamespacedZoneInnerNamespacedZone();
}

abstract interface class AppApp {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class EnAppApp implements AppApp {
  Map<String, Object?> get _contentMap => {
        'title': title,
        'description': description,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String title = Intl.message('''Yalo app''', name: 'title');

  @override
  final String description = Intl.message('''This app will show you how to use yalo package''', name: 'description');
}

abstract interface class CheckoutCheckout {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class EnCheckoutCheckout implements CheckoutCheckout {
  Map<String, Object?> get _contentMap => {
        'title': title,
        'description': description,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String title = Intl.message('''Checkout''', name: 'title');

  @override
  final String description = Intl.message('''You should checkout''', name: 'description');
}

abstract interface class CartCart {
  T getContent<T>(String key);
  String get title;
  String get description;
  CartCheckout get checkout;
}

class EnCartCart implements CartCart {
  Map<String, Object?> get _contentMap => {
        'title': title,
        'description': description,
        'checkout': checkout,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String title = Intl.message('''Cart''', name: 'title');

  @override
  final String description = Intl.message('''Please, fill the cart to do checkout''', name: 'description');
  @override
  final CartCheckout checkout = EnCartCheckout();
}

abstract interface class MainScreenMainScreen {
  T getContent<T>(String key);
  String product({
    required String brand,
    required int howMany,
    int? precision,
  });
}

class EnMainScreenMainScreen implements MainScreenMainScreen {
  Map<String, Object?> get _contentMap => {
        'product': product,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  String product({
    required String brand,
    required int howMany,
    int? precision,
  }) =>
      Intl.plural(
        howMany,
        name: '''product''',
        zero: '''There no products.''',
        one: '''There is only one product left from the brand $brand.''',
        two: '''It is your last chance to buy product from the $brand.''',
        few: '''You can buy $howMany products''',
        many: '''You can buy $howMany products''',
        other: '''You can buy $howMany products''',
        precision: precision,
      );
}

abstract interface class NameName {
  T getContent<T>(String key);
  String get collision;
}

class EnNameName implements NameName {
  Map<String, Object?> get _contentMap => {
        'collision': collision,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String collision = Intl.message('''Mike''', name: 'collision');
}

abstract interface class Second_nameSecond_name {
  T getContent<T>(String key);
  String get collision;
}

class EnSecond_nameSecond_name implements Second_nameSecond_name {
  Map<String, Object?> get _contentMap => {
        'collision': collision,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String collision = Intl.message('''Alfa''', name: 'collision');
}

abstract interface class LocalizationMessages {
  T getContent<T>(String key);
  String get cancel;
  String get save;
  String book(int howMany, {int? precision});
  NamespacedZone get namespacedZone;
  App get app;
  Cart get cart;
  String people(int howMany, {int? precision});
  String greetings({
    required String userName,
    required String hotelName,
  });
  String weather({
    required String temperature,
  });
  String shop({
    required String shopName,
    required int howMany,
    required String city,
    int? precision,
  });
  MainScreen get mainScreen;
  Name get name;
  Second_name get second_name;
}

class En implements LocalizationMessages {
  Map<String, Object?> get _contentMap => {
        'cancel': cancel,
        'save': save,
        'book': book,
        'namespacedZone': namespacedZone,
        'app': app,
        'cart': cart,
        'people': people,
        'greetings': greetings,
        'weather': weather,
        'shop': shop,
        'mainScreen': mainScreen,
        'name': name,
        'second_name': second_name,
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  @override
  final String cancel = Intl.message('''Cancel''', name: 'cancel');

  /// Saving something
  @override
  final String save = Intl.message('''Save''', name: 'save');

  /// Uses for description of books count
  @override
  String book(int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: '''book''',
        zero: '''books''',
        one: '''book''',
        two: '''books''',
        few: '''books''',
        many: '''books''',
        other: '''books''',
        precision: precision,
      );
  @override
  final NamespacedZone namespacedZone = EnNamespacedZone();
  @override
  final App app = EnApp();
  @override
  final Cart cart = EnCart();

  /// An example with numeric substitution in plural strings
  @override
  String people(int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: '''people''',
        zero: '''I saw no people there''',
        one: '''I saw only one man there''',
        two: '''I saw two people there''',
        few: '''I saw $howMany people there''',
        many: '''I saw $howMany or more people there''',
        other: '''I think, I saw $howMany people there''',
        precision: precision,
      );

  @override
  String greetings({
    required String userName,
    required String hotelName,
  }) =>
      Intl.message('''Hello $userName! We are glad to see you at our $hotelName hotel!''', name: 'greetings');

  /// Title on the main weather screen (see here: https://www.figma.com/community/file/974352831498882628)
  @override
  String weather({
    required String temperature,
  }) =>
      Intl.message('''It's $temperature degrees outside today!''', name: 'weather');

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
        precision: precision,
      );
  @override
  final MainScreen mainScreen = EnMainScreen();
  @override
  final Name name = EnName();
  @override
  final Second_name second_name = EnSecond_name();
}

class LocalizationDelegate extends LocalizationsDelegate<LocalizationMessages> {
  @override
  bool isSupported(Locale locale) => _languageMap.keys.contains(locale.languageCode);

  @override
  Future<LocalizationMessages> load(Locale locale) async {
    Intl.defaultLocale = locale.countryCode == null ? locale.languageCode : locale.toString();
    return _languageMap[locale.languageCode]!;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationMessages> old) => false;

  final Map<String, LocalizationMessages> _languageMap = {
    'en': En(),
  };
}

class Messages {
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages)!;

  static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
}

final List<LocalizationsDelegate> localizationsDelegates = [
  LocalizationDelegate(),
  ...GlobalMaterialLocalizations.delegates
];

const List<Locale> supportedLocales = [
  Locale('en'),
];
