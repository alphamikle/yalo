// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_delegate.dart';

// **************************************************************************
// IntlGenerator
// **************************************************************************

class _NamespacedZoneCheckout {
  final String title = '';
}

class _RuNamespacedZoneCheckout implements _NamespacedZoneCheckout {
  /// Description: ""
  /// Example: "Оформление заказа для доп. страницы"
  @override
  final String title = Intl.message('Оформление заказа для доп. страницы',
      name: 'title', desc: '');
}

class _NamespacedZoneInnerNamespacedZone {
  final String title = '';
  final String description = '';
  String book(int howMany) => '';
}

class _RuNamespacedZoneInnerNamespacedZone
    implements _NamespacedZoneInnerNamespacedZone {
  /// Description: ""
  /// Example: "Более глубокий заголовок"
  @override
  final String title =
      Intl.message('Более глубокий заголовок', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Более глубокое описание"
  @override
  final String description =
      Intl.message('Более глубокое описание', name: 'description', desc: '');

  /// Description: "Используется для описания количества книг в Inner namespace"
  /// Example: "zero: книг, one: книга, two: книги, few: книги, many: книг, other: книг"
  @override
  String book(int howMany) => Intl.plural(
        howMany,
        name: 'book',
        zero: 'книг',
        one: 'книга',
        two: 'книги',
        few: 'книги',
        many: 'книг',
        other: 'книг',
        desc: 'Используется для описания количества книг в Inner namespace',
      );
}

class _NamespacedZone {
  final String title = '';
  final String description = '';
  final _NamespacedZoneCheckout checkout = _NamespacedZoneCheckout();
  final _NamespacedZoneInnerNamespacedZone innerNamespacedZone =
      _NamespacedZoneInnerNamespacedZone();
}

class _RuNamespacedZone implements _NamespacedZone {
  /// Description: ""
  /// Example: "Заголовок"
  @override
  final String title = Intl.message('Заголовок', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Описание"
  @override
  final String description =
      Intl.message('Описание', name: 'description', desc: '');
  @override
  final _NamespacedZoneCheckout checkout = _RuNamespacedZoneCheckout();
  @override
  final _NamespacedZoneInnerNamespacedZone innerNamespacedZone =
      _RuNamespacedZoneInnerNamespacedZone();
}

class _CartCheckout {
  final String title = '';
  final String description = '';
}

class _RuCartCheckout implements _CartCheckout {
  /// Description: ""
  /// Example: "Оформление заказа"
  @override
  final String title =
      Intl.message('Оформление заказа', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Вам необходимо оформить заказ"
  @override
  final String description = Intl.message('Вам необходимо оформить заказ',
      name: 'description', desc: '');
}

class _Cart {
  final String title = '';
  final String description = '';
  final _CartCheckout checkout = _CartCheckout();
}

class _RuCart implements _Cart {
  /// Description: ""
  /// Example: "Корзина"
  @override
  final String title = Intl.message('Корзина', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Наполните корзину для оформления заказа"
  @override
  final String description = Intl.message(
      'Наполните корзину для оформления заказа',
      name: 'description',
      desc: '');
  @override
  final _CartCheckout checkout = _RuCartCheckout();
}

abstract class LocalizationMessages {
  final String ok = '';
  final String save = '';
  String book(int howMany) => '';
  final _NamespacedZone namespacedZone = _RuNamespacedZone();
  final _Cart cart = _RuCart();
}

class _Ru implements LocalizationMessages {
  /// Description: ""
  /// Example: "OK"
  @override
  final String ok = Intl.message('OK', name: 'ok', desc: '');

  /// Description: "Сохранение чего-либо где-либо"
  /// Example: "Сохранить"
  @override
  final String save = Intl.message('Сохранить',
      name: 'save', desc: 'Сохранение чего-либо где-либо');

  /// Description: "Используется для описания количества книг"
  /// Example: "zero: книг, one: книга, two: книги, few: книги, many: книг, other: книг"
  @override
  String book(int howMany) => Intl.plural(
        howMany,
        name: 'book',
        zero: 'книг',
        one: 'книга',
        two: 'книги',
        few: 'книги',
        many: 'книг',
        other: 'книг',
        desc: 'Используется для описания количества книг',
      );
  @override
  final _NamespacedZone namespacedZone = _RuNamespacedZone();
  @override
  final _Cart cart = _RuCart();
}

class _EnNamespacedZoneCheckout implements _NamespacedZoneCheckout {
  /// Description: ""
  /// Example: "Checkoout for additional page"
  @override
  final String title =
      Intl.message('Checkoout for additional page', name: 'title', desc: '');
}

class _EnNamespacedZoneInnerNamespacedZone
    implements _NamespacedZoneInnerNamespacedZone {
  /// Description: ""
  /// Example: "Deeper title of Inner namespaced zone"
  @override
  final String title = Intl.message('Deeper title of Inner namespaced zone',
      name: 'title', desc: '');

  /// Description: ""
  /// Example: "Deeper description of Inner namespaced zone"
  @override
  final String description = Intl.message(
      'Deeper description of Inner namespaced zone',
      name: 'description',
      desc: '');

  /// Description: "Uses for description of books count"
  /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
  @override
  String book(int howMany) => Intl.plural(
        howMany,
        name: 'book',
        zero: 'books',
        one: 'book',
        two: 'books',
        few: 'books',
        many: 'books',
        other: 'books',
        desc: 'Uses for description of books count',
      );
}

class _EnNamespacedZone implements _NamespacedZone {
  /// Description: ""
  /// Example: "Title of Namespaced zone"
  @override
  final String title =
      Intl.message('Title of Namespaced zone', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Description of Namespaced zone"
  @override
  final String description = Intl.message('Description of Namespaced zone',
      name: 'description', desc: '');
  @override
  final _NamespacedZoneCheckout checkout = _EnNamespacedZoneCheckout();
  @override
  final _NamespacedZoneInnerNamespacedZone innerNamespacedZone =
      _EnNamespacedZoneInnerNamespacedZone();
}

class _EnCartCheckout implements _CartCheckout {
  /// Description: ""
  /// Example: "Checkout"
  @override
  final String title = Intl.message('Checkout', name: 'title', desc: '');

  /// Description: ""
  /// Example: "You should checkout"
  @override
  final String description =
      Intl.message('You should checkout', name: 'description', desc: '');
}

class _EnCart implements _Cart {
  /// Description: ""
  /// Example: "Cart"
  @override
  final String title = Intl.message('Cart', name: 'title', desc: '');

  /// Description: ""
  /// Example: "Please, fill the cart to do checkout"
  @override
  final String description = Intl.message(
      'Please, fill the cart to do checkout',
      name: 'description',
      desc: '');
  @override
  final _CartCheckout checkout = _EnCartCheckout();
}

class _En implements LocalizationMessages {
  /// Description: ""
  /// Example: "OK"
  @override
  final String ok = Intl.message('OK', name: 'ok', desc: '');

  /// Description: "Saving something"
  /// Example: "Save"
  @override
  final String save =
      Intl.message('Save', name: 'save', desc: 'Saving something');

  /// Description: "Uses for description of books count"
  /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
  @override
  String book(int howMany) => Intl.plural(
        howMany,
        name: 'book',
        zero: 'books',
        one: 'book',
        two: 'books',
        few: 'books',
        many: 'books',
        other: 'books',
        desc: 'Uses for description of books count',
      );
  @override
  final _NamespacedZone namespacedZone = _EnNamespacedZone();
  @override
  final _Cart cart = _EnCart();
}

class _$LocalizationDelegate
    extends LocalizationsDelegate<LocalizationMessages> {
  @override
  bool isSupported(Locale locale) =>
      _languageMap.keys.contains(locale.languageCode);

  @override
  Future<LocalizationMessages> load(Locale locale) async {
    Intl.defaultLocale =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    return _languageMap[locale.languageCode];
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationMessages> old) => false;
  final Map<String, LocalizationMessages> _languageMap = {
    'ru': _Ru(),
    'en': _En(),
  };
}

class Messages {
  static LocalizationMessages of(BuildContext context) =>
      Localizations.of(context, LocalizationMessages);
}
