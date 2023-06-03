import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class FirstSecond {
  T getContent<T>(String key);
  SecondThird get third;
}

class EnFirstSecond implements FirstSecond {
  Map<String, Object?> get _contentMap => {
        'third': third,
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
  final SecondThird third = EnSecondThird();
}

abstract interface class PrimaryFirst {
  T getContent<T>(String key);
  FirstSecond get second;
}

class EnPrimaryFirst implements PrimaryFirst {
  Map<String, Object?> get _contentMap => {
        'second': second,
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
  final FirstSecond second = EnFirstSecond();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class FirstSecond {
  T getContent<T>(String key);
  SecondThird get third;
}

class EnFirstSecond implements FirstSecond {
  Map<String, Object?> get _contentMap => {
        'third': third,
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
  final SecondThird third = EnSecondThird();
}

abstract interface class PrimaryFirst {
  T getContent<T>(String key);
  FirstSecond get second;
}

class EnPrimaryFirst implements PrimaryFirst {
  Map<String, Object?> get _contentMap => {
        'second': second,
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
  final FirstSecond second = EnFirstSecond();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class FirstSecond {
  T getContent<T>(String key);
  SecondThird get third;
}

class EnFirstSecond implements FirstSecond {
  Map<String, Object?> get _contentMap => {
        'third': third,
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
  final SecondThird third = EnSecondThird();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class FirstSecond {
  T getContent<T>(String key);
  SecondThird get third;
}

class EnFirstSecond implements FirstSecond {
  Map<String, Object?> get _contentMap => {
        'third': third,
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
  final SecondThird third = EnSecondThird();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class ThirdFourth {
  T getContent<T>(String key);
  String get fifth;
}

class EnThirdFourth implements ThirdFourth {
  Map<String, Object?> get _contentMap => {
        'fifth': fifth,
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
  final String fifth = Intl.message('''Hello!''', name: 'fifth');
}

abstract interface class SecondThird {
  T getContent<T>(String key);
  ThirdFourth get fourth;
  ThirdFourth get fourth;
  ThirdFourth get fourth;
}

class EnSecondThird implements SecondThird {
  Map<String, Object?> get _contentMap => {
        'fourth': fourth,
        'fourth': fourth,
        'fourth': fourth,
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
  final ThirdFourth fourth = EnThirdFourth();
  @override
  final ThirdFourth fourth = EnThirdFourth();
  @override
  final ThirdFourth fourth = EnThirdFourth();
}

abstract interface class FirstSecond {
  T getContent<T>(String key);
  SecondThird get third;
  SecondThird get third;
  SecondThird get third;
}

class EnFirstSecond implements FirstSecond {
  Map<String, Object?> get _contentMap => {
        'third': third,
        'third': third,
        'third': third,
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
  final SecondThird third = EnSecondThird();
  @override
  final SecondThird third = EnSecondThird();
  @override
  final SecondThird third = EnSecondThird();
}

abstract interface class PrimaryFirst {
  T getContent<T>(String key);
  FirstSecond get second;
  FirstSecond get second;
  FirstSecond get second;
}

class EnPrimaryFirst implements PrimaryFirst {
  Map<String, Object?> get _contentMap => {
        'second': second,
        'second': second,
        'second': second,
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
  final FirstSecond second = EnFirstSecond();
  @override
  final FirstSecond second = EnFirstSecond();
  @override
  final FirstSecond second = EnFirstSecond();
}

abstract interface class Primary {
  T getContent<T>(String key);
  PrimaryFirst get first;
  PrimaryFirst get first;
  PrimaryFirst get first;
}

class EnPrimary implements Primary {
  Map<String, Object?> get _contentMap => {
        'first': first,
        'first': first,
        'first': first,
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
  final PrimaryFirst first = EnPrimaryFirst();
  @override
  final PrimaryFirst first = EnPrimaryFirst();
  @override
  final PrimaryFirst first = EnPrimaryFirst();
}

abstract interface class LocalizationMessages {
  T getContent<T>(String key);
  Primary get primary;
}

class En implements LocalizationMessages {
  Map<String, Object?> get _contentMap => {
        'primary': primary,
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
  final Primary primary = EnPrimary();
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
