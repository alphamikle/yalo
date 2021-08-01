import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

      abstract class _NamespacedZoneCheckout {
      late String title;
      }
      class _DeNamespacedZoneCheckout extends _NamespacedZoneCheckout {
      /// Description: ""
    /// Example: "Checkoout for additional page"
    @override
    final String title = Intl.message('Checkoout for additional page', name: 'title', desc: '');
      }
      abstract class _NamespacedZoneInnerNamespacedZone {
      late String title;
      late String description;
        String book(int howMany);
        }
      class _DeNamespacedZoneInnerNamespacedZone extends _NamespacedZoneInnerNamespacedZone {
      /// Description: ""
    /// Example: "Deeper title of Inner namespaced zone"
    @override
    final String title = Intl.message('Deeper title of Inner namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Deeper description of Inner namespaced zone"
    @override
    final String description = Intl.message('Deeper description of Inner namespaced zone', name: 'description', desc: '');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      abstract class _NamespacedZone {
      late String title;
      late String description;
      late _NamespacedZoneCheckout checkout;
      late _NamespacedZoneInnerNamespacedZone innerNamespacedZone;
      }
      class _DeNamespacedZone extends _NamespacedZone {
      /// Description: ""
    /// Example: "Title of Namespaced zone"
    @override
    final String title = Intl.message('Title of Namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Description of Namespaced zone"
    @override
    final String description = Intl.message('Description of Namespaced zone', name: 'description', desc: '');
      @override
    final _NamespacedZoneCheckout checkout = _DeNamespacedZoneCheckout();
      @override
    final _NamespacedZoneInnerNamespacedZone innerNamespacedZone = _DeNamespacedZoneInnerNamespacedZone();
      }
      abstract class _CartCheckout {
      late String title;
      late String description;
      }
      class _DeCartCheckout extends _CartCheckout {
      /// Description: ""
    /// Example: "Checkout"
    @override
    final String title = Intl.message('Checkout', name: 'title', desc: '');
      /// Description: ""
    /// Example: "You should checkout"
    @override
    final String description = Intl.message('You should checkout', name: 'description', desc: '');
      }
      abstract class _Cart {
      late String title;
      late String description;
      late _CartCheckout checkout;
      }
      class _DeCart extends _Cart {
      /// Description: ""
    /// Example: "Cart"
    @override
    final String title = Intl.message('Cart', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Please, fill the cart to do checkout"
    @override
    final String description = Intl.message('Please, fill the cart to do checkout', name: 'description', desc: '');
      @override
    final _CartCheckout checkout = _DeCartCheckout();
      }
      abstract class LocalizationMessages {
      late String ok;
      late String save;
        String book(int howMany);
        late _NamespacedZone namespacedZone;
      late _Cart cart;
      }
      class _De extends LocalizationMessages {
      /// Description: ""
    /// Example: "OK"
    @override
    final String ok = Intl.message('OK', name: 'ok', desc: '');
      /// Description: "Saving something"
    /// Example: "Save"
    @override
    final String save = Intl.message('Save', name: 'save', desc: 'Saving something');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
    final _NamespacedZone namespacedZone = _DeNamespacedZone();
      @override
    final _Cart cart = _DeCart();
      }
      class _RuNamespacedZoneCheckout extends _NamespacedZoneCheckout {
      /// Description: ""
    /// Example: "Оформление заказа для доп. страницы"
    @override
    final String title = Intl.message('Оформление заказа для доп. страницы', name: 'title', desc: '');
      }
      class _RuNamespacedZoneInnerNamespacedZone extends _NamespacedZoneInnerNamespacedZone {
      /// Description: ""
    /// Example: "Более глубокий заголовок"
    @override
    final String title = Intl.message('Более глубокий заголовок', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Более глубокое описание"
    @override
    final String description = Intl.message('Более глубокое описание', name: 'description', desc: '');
      /// Description: "Используется для описания количества книг в Inner namespace"
    /// Example: "zero: книг, one: книга, two: книги, few: книги, many: книг, other: книг"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      class _RuNamespacedZone extends _NamespacedZone {
      /// Description: ""
    /// Example: "Заголовок"
    @override
    final String title = Intl.message('Заголовок', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Описание"
    @override
    final String description = Intl.message('Описание', name: 'description', desc: '');
      @override
    final _NamespacedZoneCheckout checkout = _RuNamespacedZoneCheckout();
      @override
    final _NamespacedZoneInnerNamespacedZone innerNamespacedZone = _RuNamespacedZoneInnerNamespacedZone();
      }
      class _RuCartCheckout extends _CartCheckout {
      /// Description: ""
    /// Example: "Оформление заказа"
    @override
    final String title = Intl.message('Оформление заказа', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Вам необходимо оформить заказ"
    @override
    final String description = Intl.message('Вам необходимо оформить заказ', name: 'description', desc: '');
      }
      class _RuCart extends _Cart {
      /// Description: ""
    /// Example: "Корзина"
    @override
    final String title = Intl.message('Корзина', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Наполните корзину для оформления заказа"
    @override
    final String description = Intl.message('Наполните корзину для оформления заказа', name: 'description', desc: '');
      @override
    final _CartCheckout checkout = _RuCartCheckout();
      }
      class _Ru extends LocalizationMessages {
      /// Description: ""
    /// Example: "OK"
    @override
    final String ok = Intl.message('OK', name: 'ok', desc: '');
      /// Description: "Сохранение чего-либо где-либо"
    /// Example: "Сохранить"
    @override
    final String save = Intl.message('Сохранить', name: 'save', desc: 'Сохранение чего-либо где-либо');
      /// Description: "Используется для описания количества книг"
    /// Example: "zero: книг, one: книга, two: книги, few: книги, many: книг, other: книг"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      class _ZhNamespacedZoneCheckout extends _NamespacedZoneCheckout {
      /// Description: ""
    /// Example: "Checkoout for additional page"
    @override
    final String title = Intl.message('Checkoout for additional page', name: 'title', desc: '');
      }
      class _ZhNamespacedZoneInnerNamespacedZone extends _NamespacedZoneInnerNamespacedZone {
      /// Description: ""
    /// Example: "Deeper title of Inner namespaced zone"
    @override
    final String title = Intl.message('Deeper title of Inner namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Deeper description of Inner namespaced zone"
    @override
    final String description = Intl.message('Deeper description of Inner namespaced zone', name: 'description', desc: '');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      class _ZhNamespacedZone extends _NamespacedZone {
      /// Description: ""
    /// Example: "Title of Namespaced zone"
    @override
    final String title = Intl.message('Title of Namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Description of Namespaced zone"
    @override
    final String description = Intl.message('Description of Namespaced zone', name: 'description', desc: '');
      @override
    final _NamespacedZoneCheckout checkout = _ZhNamespacedZoneCheckout();
      @override
    final _NamespacedZoneInnerNamespacedZone innerNamespacedZone = _ZhNamespacedZoneInnerNamespacedZone();
      }
      class _ZhCartCheckout extends _CartCheckout {
      /// Description: ""
    /// Example: "Checkout"
    @override
    final String title = Intl.message('Checkout', name: 'title', desc: '');
      /// Description: ""
    /// Example: "You should checkout"
    @override
    final String description = Intl.message('You should checkout', name: 'description', desc: '');
      }
      class _ZhCart extends _Cart {
      /// Description: ""
    /// Example: "Cart"
    @override
    final String title = Intl.message('Cart', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Please, fill the cart to do checkout"
    @override
    final String description = Intl.message('Please, fill the cart to do checkout', name: 'description', desc: '');
      @override
    final _CartCheckout checkout = _ZhCartCheckout();
      }
      class _Zh extends LocalizationMessages {
      /// Description: ""
    /// Example: "OK"
    @override
    final String ok = Intl.message('OK', name: 'ok', desc: '');
      /// Description: "Saving something"
    /// Example: "Save"
    @override
    final String save = Intl.message('Save', name: 'save', desc: 'Saving something');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
    final _NamespacedZone namespacedZone = _ZhNamespacedZone();
      @override
    final _Cart cart = _ZhCart();
      }
      class _EnNamespacedZoneCheckout extends _NamespacedZoneCheckout {
      /// Description: ""
    /// Example: "Checkoout for additional page"
    @override
    final String title = Intl.message('Checkoout for additional page', name: 'title', desc: '');
      }
      class _EnNamespacedZoneInnerNamespacedZone extends _NamespacedZoneInnerNamespacedZone {
      /// Description: ""
    /// Example: "Deeper title of Inner namespaced zone"
    @override
    final String title = Intl.message('Deeper title of Inner namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Deeper description of Inner namespaced zone"
    @override
    final String description = Intl.message('Deeper description of Inner namespaced zone', name: 'description', desc: '');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      class _EnNamespacedZone extends _NamespacedZone {
      /// Description: ""
    /// Example: "Title of Namespaced zone"
    @override
    final String title = Intl.message('Title of Namespaced zone', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Description of Namespaced zone"
    @override
    final String description = Intl.message('Description of Namespaced zone', name: 'description', desc: '');
      @override
    final _NamespacedZoneCheckout checkout = _EnNamespacedZoneCheckout();
      @override
    final _NamespacedZoneInnerNamespacedZone innerNamespacedZone = _EnNamespacedZoneInnerNamespacedZone();
      }
      class _EnCartCheckout extends _CartCheckout {
      /// Description: ""
    /// Example: "Checkout"
    @override
    final String title = Intl.message('Checkout', name: 'title', desc: '');
      /// Description: ""
    /// Example: "You should checkout"
    @override
    final String description = Intl.message('You should checkout', name: 'description', desc: '');
      }
      class _EnCart extends _Cart {
      /// Description: ""
    /// Example: "Cart"
    @override
    final String title = Intl.message('Cart', name: 'title', desc: '');
      /// Description: ""
    /// Example: "Please, fill the cart to do checkout"
    @override
    final String description = Intl.message('Please, fill the cart to do checkout', name: 'description', desc: '');
      @override
    final _CartCheckout checkout = _EnCartCheckout();
      }
      class _En extends LocalizationMessages {
      /// Description: ""
    /// Example: "OK"
    @override
    final String ok = Intl.message('OK', name: 'ok', desc: '');
      /// Description: "Saving something"
    /// Example: "Save"
    @override
    final String save = Intl.message('Save', name: 'save', desc: 'Saving something');
      /// Description: "Uses for description of books count"
    /// Example: "zero: books, one: book, two: books, few: books, many: books, other: books"
    @override
    String book(int howMany) => Intl.plural(howMany,
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
      'de': _De(),
        'ru': _Ru(),
        'zh': _Zh(),
        'en': _En(),
      };

    }

    class Messages {
    static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

    static LocalizationMessages get de => LocalizationDelegate()._languageMap['de']!;
    static LocalizationMessages get ru => LocalizationDelegate()._languageMap['ru']!;
    static LocalizationMessages get zh => LocalizationDelegate()._languageMap['zh']!;
    static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
    
  }
  
  final List<LocalizationsDelegate> localizationsDelegates = [LocalizationDelegate(), ...GlobalMaterialLocalizations.delegates];

  const List<Locale> supportedLocales = [
const Locale('de'),
    const Locale('ru'),
    const Locale('zh'),
    const Locale('en'),
    ];