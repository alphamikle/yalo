import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract class NamespacedZoneCheckout {
  T getContent<T>(String key);
  String get title;
}

class EnNamespacedZoneCheckout extends NamespacedZoneCheckout {
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

  /// Description: ""
  /// Example: "Checkout for additional page"
  @override
  final String title = Intl.message(
    '''Checkout for additional page''',
    name: 'title',
    desc: '',
  );
}

abstract class NamespacedZoneInnerNamespacedZone {
  T getContent<T>(String key);
  String title({
    required String name,
  });
  String get description;
  String book(int howMany, {int? precision});
}

class EnNamespacedZoneInnerNamespacedZone extends NamespacedZoneInnerNamespacedZone {
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

  /// Description: ""
  /// Example: "Deeper title of Inner namespaced zone with name $name"
  @override
  String title({
    required String name,
  }) =>
      Intl.message(
        '''Deeper title of Inner namespaced zone with name $name''',
        name: 'title',
        desc: '',
      );

  /// Description: ""
  /// Example: "Deeper description of Inner namespaced zone"
  @override
  final String description = Intl.message(
    '''Deeper description of Inner namespaced zone''',
    name: 'description',
    desc: '',
  );

  /// Description: "Uses for description of books count"
  /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
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
        desc: '''Uses for description of books count''',
        precision: precision,
      );
}

abstract class NamespacedZone {
  T getContent<T>(String key);
  String get title;
  String get description;
  NamespacedZoneCheckout get checkout;
  NamespacedZoneInnerNamespacedZone get innerNamespacedZone;
}

class EnNamespacedZone extends NamespacedZone {
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

  /// Description: ""
  /// Example: "Title of Namespaced zone"
  @override
  final String title = Intl.message(
    '''Title of Namespaced zone''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "Description of Namespaced zone"
  @override
  final String description = Intl.message(
    '''Description of Namespaced zone''',
    name: 'description',
    desc: '',
  );
  @override
  final NamespacedZoneCheckout checkout = EnNamespacedZoneCheckout();
  @override
  final NamespacedZoneInnerNamespacedZone innerNamespacedZone = EnNamespacedZoneInnerNamespacedZone();
}

abstract class App {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class EnApp extends App {
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

  /// Description: ""
  /// Example: "Yalo app"
  @override
  final String title = Intl.message(
    '''Yalo app''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "This app will show you how to use yalo package"
  @override
  final String description = Intl.message(
    '''This app will show you how to use yalo package''',
    name: 'description',
    desc: '',
  );
}

abstract class CartCheckout {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class EnCartCheckout extends CartCheckout {
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

  /// Description: ""
  /// Example: "Checkout"
  @override
  final String title = Intl.message(
    '''Checkout''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "You should checkout"
  @override
  final String description = Intl.message(
    '''You should checkout''',
    name: 'description',
    desc: '',
  );
}

abstract class Cart {
  T getContent<T>(String key);
  String get title;
  String get description;
  CartCheckout get checkout;
}

class EnCart extends Cart {
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

  /// Description: ""
  /// Example: "Cart"
  @override
  final String title = Intl.message(
    '''Cart''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "Please, fill the cart to do checkout"
  @override
  final String description = Intl.message(
    '''Please, fill the cart to do checkout''',
    name: 'description',
    desc: '',
  );
  @override
  final CartCheckout checkout = EnCartCheckout();
}

abstract class MainScreen {
  T getContent<T>(String key);
  String product({
    required String brand,
    required int howMany,
    int? precision,
  });
}

class EnMainScreen extends MainScreen {
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

  /// Description: ""
  /// Example: "zero: There no products., one: There is only one product left from the brand $brand., two: It is your last chance to buy product from the $brand., few: null, many: null, other: You can buy $howMany products"
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
        desc: '''''',
        precision: precision,
      );
}

abstract class LocalizationMessages {
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
}

class En extends LocalizationMessages {
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
      };

  @override
  T getContent<T>(String key) {
    final Object? content = _contentMap[key];
    if (content is T) {
      return content;
    }
    throw Exception('Not found correct content of type "$T" by key "$key"');
  }

  /// Description: ""
  /// Example: "Cancel"
  @override
  final String cancel = Intl.message(
    '''Cancel''',
    name: 'cancel',
    desc: '',
  );

  /// Description: "Saving something"
  /// Example: "Save"
  @override
  final String save = Intl.message(
    '''Save''',
    name: 'save',
    desc: 'Saving something',
  );

  /// Description: "Uses for description of books count"
  /// Example: "zero: books, one: book, two: books, few: null, many: null, other: books"
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
        desc: '''Uses for description of books count''',
        precision: precision,
      );
  @override
  final NamespacedZone namespacedZone = EnNamespacedZone();
  @override
  final App app = EnApp();
  @override
  final Cart cart = EnCart();

  /// Description: "An example with numeric substitution in plural strings"
  /// Example: "zero: I saw no people there, one: I saw only one man there, two: I saw two people there, few: I saw $howMany people there, many: I saw $howMany or more people there, other: I think, I saw $howMany people there"
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
        desc: '''An example with numeric substitution in plural strings''',
        precision: precision,
      );

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
  @override
  final MainScreen mainScreen = EnMainScreen();
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
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

  static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
}

final List<LocalizationsDelegate> localizationsDelegates = [
  LocalizationDelegate(),
  ...GlobalMaterialLocalizations.delegates
];

const List<Locale> supportedLocales = [
  Locale('en'),
];
