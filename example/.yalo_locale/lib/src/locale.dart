import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

abstract class App {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class DeApp extends App {
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
  /// Example: "Presidents app"
  @override
  final String description = Intl.message(
    '''Presidents app''',
    name: 'description',
    desc: '',
  );
}

abstract class Tooltips {
  T getContent<T>(String key);
  String get increment;
}

class DeTooltips extends Tooltips {
  Map<String, Object?> get _contentMap => {
        'increment': increment,
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
  /// Example: "Zuwachs"
  @override
  final String increment = Intl.message(
    '''Zuwachs''',
    name: 'increment',
    desc: '',
  );
}

abstract class Presidents {
  T getContent<T>(String key);
  String get p1;
  String get p2;
  String get p3;
  String get p4;
  String get p5;
  String get p6;
  String get p7;
  String get p8;
  String get p9;
  String get p10;
  String get p11;
  String get p12;
  String get p13;
  String get p14;
  String get p15;
  String get p16;
  String get p17;
  String get p18;
  String get p19;
  String get p20;
  String get p21;
  String get p22;
  String get p23;
  String get p24;
  String get p25;
  String get p26;
  String get p27;
  String get p28;
  String get p29;
  String get p30;
  String get p31;
  String get p32;
  String get p33;
  String get p34;
  String get p35;
  String get p36;
  String get p37;
  String get p38;
  String get p39;
  String get p40;
  String get p41;
  String get p42;
  String get p43;
  String get p44;
  String get p45;
  String get p46;
}

class DePresidents extends Presidents {
  Map<String, Object?> get _contentMap => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p5': p5,
        'p6': p6,
        'p7': p7,
        'p8': p8,
        'p9': p9,
        'p10': p10,
        'p11': p11,
        'p12': p12,
        'p13': p13,
        'p14': p14,
        'p15': p15,
        'p16': p16,
        'p17': p17,
        'p18': p18,
        'p19': p19,
        'p20': p20,
        'p21': p21,
        'p22': p22,
        'p23': p23,
        'p24': p24,
        'p25': p25,
        'p26': p26,
        'p27': p27,
        'p28': p28,
        'p29': p29,
        'p30': p30,
        'p31': p31,
        'p32': p32,
        'p33': p33,
        'p34': p34,
        'p35': p35,
        'p36': p36,
        'p37': p37,
        'p38': p38,
        'p39': p39,
        'p40': p40,
        'p41': p41,
        'p42': p42,
        'p43': p43,
        'p44': p44,
        'p45': p45,
        'p46': p46,
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
  /// Example: "George Washington"
  @override
  final String p1 = Intl.message(
    '''George Washington''',
    name: 'p1',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Adams"
  @override
  final String p2 = Intl.message(
    '''John Adams''',
    name: 'p2',
    desc: '',
  );

  /// Description: ""
  /// Example: "Thomas Jefferson"
  @override
  final String p3 = Intl.message(
    '''Thomas Jefferson''',
    name: 'p3',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Madison"
  @override
  final String p4 = Intl.message(
    '''James Madison''',
    name: 'p4',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Monroe"
  @override
  final String p5 = Intl.message(
    '''James Monroe''',
    name: 'p5',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Quincy Adams"
  @override
  final String p6 = Intl.message(
    '''John Quincy Adams''',
    name: 'p6',
    desc: '',
  );

  /// Description: ""
  /// Example: "Andrew Jackson"
  @override
  final String p7 = Intl.message(
    '''Andrew Jackson''',
    name: 'p7',
    desc: '',
  );

  /// Description: ""
  /// Example: "Martin Van Buren"
  @override
  final String p8 = Intl.message(
    '''Martin Van Buren''',
    name: 'p8',
    desc: '',
  );

  /// Description: ""
  /// Example: "William Henry Harrison"
  @override
  final String p9 = Intl.message(
    '''William Henry Harrison''',
    name: 'p9',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Tyler"
  @override
  final String p10 = Intl.message(
    '''John Tyler''',
    name: 'p10',
    desc: '',
  );

  /// Description: ""
  /// Example: "James K. Polk"
  @override
  final String p11 = Intl.message(
    '''James K. Polk''',
    name: 'p11',
    desc: '',
  );

  /// Description: ""
  /// Example: "Zachary Taylor"
  @override
  final String p12 = Intl.message(
    '''Zachary Taylor''',
    name: 'p12',
    desc: '',
  );

  /// Description: ""
  /// Example: "Millard Fillmore"
  @override
  final String p13 = Intl.message(
    '''Millard Fillmore''',
    name: 'p13',
    desc: '',
  );

  /// Description: ""
  /// Example: "Franklin Pierce"
  @override
  final String p14 = Intl.message(
    '''Franklin Pierce''',
    name: 'p14',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Buchanan"
  @override
  final String p15 = Intl.message(
    '''James Buchanan''',
    name: 'p15',
    desc: '',
  );

  /// Description: ""
  /// Example: "Abraham Lincoln"
  @override
  final String p16 = Intl.message(
    '''Abraham Lincoln''',
    name: 'p16',
    desc: '',
  );

  /// Description: ""
  /// Example: "Andrew Johnson"
  @override
  final String p17 = Intl.message(
    '''Andrew Johnson''',
    name: 'p17',
    desc: '',
  );

  /// Description: ""
  /// Example: "Ulysses S. Grant"
  @override
  final String p18 = Intl.message(
    '''Ulysses S. Grant''',
    name: 'p18',
    desc: '',
  );

  /// Description: ""
  /// Example: "Rutherford B. Hayes"
  @override
  final String p19 = Intl.message(
    '''Rutherford B. Hayes''',
    name: 'p19',
    desc: '',
  );

  /// Description: ""
  /// Example: "James A. Garfield"
  @override
  final String p20 = Intl.message(
    '''James A. Garfield''',
    name: 'p20',
    desc: '',
  );

  /// Description: ""
  /// Example: "Chester A. Arthur"
  @override
  final String p21 = Intl.message(
    '''Chester A. Arthur''',
    name: 'p21',
    desc: '',
  );

  /// Description: ""
  /// Example: "Grover Cleveland"
  @override
  final String p22 = Intl.message(
    '''Grover Cleveland''',
    name: 'p22',
    desc: '',
  );

  /// Description: ""
  /// Example: "Benjamin Harrison"
  @override
  final String p23 = Intl.message(
    '''Benjamin Harrison''',
    name: 'p23',
    desc: '',
  );

  /// Description: ""
  /// Example: "Grover Cleveland"
  @override
  final String p24 = Intl.message(
    '''Grover Cleveland''',
    name: 'p24',
    desc: '',
  );

  /// Description: ""
  /// Example: "William McKinley"
  @override
  final String p25 = Intl.message(
    '''William McKinley''',
    name: 'p25',
    desc: '',
  );

  /// Description: ""
  /// Example: "Theodore Roosevelt"
  @override
  final String p26 = Intl.message(
    '''Theodore Roosevelt''',
    name: 'p26',
    desc: '',
  );

  /// Description: ""
  /// Example: "William H. Taft"
  @override
  final String p27 = Intl.message(
    '''William H. Taft''',
    name: 'p27',
    desc: '',
  );

  /// Description: ""
  /// Example: "Woodrow Wilson"
  @override
  final String p28 = Intl.message(
    '''Woodrow Wilson''',
    name: 'p28',
    desc: '',
  );

  /// Description: ""
  /// Example: "Warren G. Harding"
  @override
  final String p29 = Intl.message(
    '''Warren G. Harding''',
    name: 'p29',
    desc: '',
  );

  /// Description: ""
  /// Example: "Calvin Coolidge"
  @override
  final String p30 = Intl.message(
    '''Calvin Coolidge''',
    name: 'p30',
    desc: '',
  );

  /// Description: ""
  /// Example: "Herbert C. Hoover"
  @override
  final String p31 = Intl.message(
    '''Herbert C. Hoover''',
    name: 'p31',
    desc: '',
  );

  /// Description: ""
  /// Example: "Franklin D. Roosevelt"
  @override
  final String p32 = Intl.message(
    '''Franklin D. Roosevelt''',
    name: 'p32',
    desc: '',
  );

  /// Description: ""
  /// Example: "Harry S. Truman"
  @override
  final String p33 = Intl.message(
    '''Harry S. Truman''',
    name: 'p33',
    desc: '',
  );

  /// Description: ""
  /// Example: "Dwight D. Eisenhower"
  @override
  final String p34 = Intl.message(
    '''Dwight D. Eisenhower''',
    name: 'p34',
    desc: '',
  );

  /// Description: ""
  /// Example: "John F. Kennedy"
  @override
  final String p35 = Intl.message(
    '''John F. Kennedy''',
    name: 'p35',
    desc: '',
  );

  /// Description: ""
  /// Example: "Lyndon B. Johnson"
  @override
  final String p36 = Intl.message(
    '''Lyndon B. Johnson''',
    name: 'p36',
    desc: '',
  );

  /// Description: ""
  /// Example: "Richard M. Nixon"
  @override
  final String p37 = Intl.message(
    '''Richard M. Nixon''',
    name: 'p37',
    desc: '',
  );

  /// Description: ""
  /// Example: "Gerald R. Ford"
  @override
  final String p38 = Intl.message(
    '''Gerald R. Ford''',
    name: 'p38',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Earl Carter"
  @override
  final String p39 = Intl.message(
    '''James Earl Carter''',
    name: 'p39',
    desc: '',
  );

  /// Description: ""
  /// Example: "Ronald Reagan"
  @override
  final String p40 = Intl.message(
    '''Ronald Reagan''',
    name: 'p40',
    desc: '',
  );

  /// Description: ""
  /// Example: "George Bush"
  @override
  final String p41 = Intl.message(
    '''George Bush''',
    name: 'p41',
    desc: '',
  );

  /// Description: ""
  /// Example: "William J. Clinton"
  @override
  final String p42 = Intl.message(
    '''William J. Clinton''',
    name: 'p42',
    desc: '',
  );

  /// Description: ""
  /// Example: "George W. Bush"
  @override
  final String p43 = Intl.message(
    '''George W. Bush''',
    name: 'p43',
    desc: '',
  );

  /// Description: ""
  /// Example: "Barack H. Obama"
  @override
  final String p44 = Intl.message(
    '''Barack H. Obama''',
    name: 'p44',
    desc: '',
  );

  /// Description: ""
  /// Example: "Donald J. Trump"
  @override
  final String p45 = Intl.message(
    '''Donald J. Trump''',
    name: 'p45',
    desc: '',
  );

  /// Description: ""
  /// Example: "Joseph R. Biden, Jr."
  @override
  final String p46 = Intl.message(
    '''Joseph R. Biden, Jr.''',
    name: 'p46',
    desc: '',
  );
}

abstract class SecondStoryExample {
  T getContent<T>(String key);
  String get title;
  String get description;
}

class DeSecondStoryExample extends SecondStoryExample {
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
  /// Example: "This is a title"
  @override
  final String title = Intl.message(
    '''This is a title''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "This is a description"
  @override
  final String description = Intl.message(
    '''This is a description''',
    name: 'description',
    desc: '',
  );
}

abstract class FirstTabSecondStory {
  T getContent<T>(String key);
  SecondStoryExample get example;
}

class DeFirstTabSecondStory extends FirstTabSecondStory {
  Map<String, Object?> get _contentMap => {
        'example': example,
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
  final SecondStoryExample example = DeSecondStoryExample();
}

abstract class MainViewFirstTab {
  T getContent<T>(String key);
  FirstTabSecondStory get secondStory;
}

class DeMainViewFirstTab extends MainViewFirstTab {
  Map<String, Object?> get _contentMap => {
        'secondStory': secondStory,
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
  final FirstTabSecondStory secondStory = DeFirstTabSecondStory();
}

abstract class MainView {
  T getContent<T>(String key);
  MainViewFirstTab get firstTab;
}

class DeMainView extends MainView {
  Map<String, Object?> get _contentMap => {
        'firstTab': firstTab,
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
  final MainViewFirstTab firstTab = DeMainViewFirstTab();
}

abstract class LocalizationMessages {
  T getContent<T>(String key);
  App get app;
  String books({
    required String user,
    required int howMany,
    int? precision,
  });
  Tooltips get tooltips;
  Presidents get presidents;
  MainView get mainView;
}

class De extends LocalizationMessages {
  Map<String, Object?> get _contentMap => {
        'app': app,
        'books': books,
        'tooltips': tooltips,
        'presidents': presidents,
        'mainView': mainView,
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
  final App app = DeApp();

  /// Description: ""
  /// Example: "zero: Hallo, $user! Du hast keine Bücher., one: Hallo, $user! Sie haben ein Buch., two: Hallo, $user! Du hast zwei Bücher! Weiter so!, few: Hallo, $user! Sie haben $howMany Buch! Sehr beeindruckend!, many: null, other: Hallo, $user! Sie haben $howMany Buch! Sehr beeindruckend!"
  @override
  String books({
    required String user,
    required int howMany,
    int? precision,
  }) =>
      Intl.plural(
        howMany,
        name: '''books''',
        zero: '''Hallo, $user! Du hast keine Bücher.''',
        one: '''Hallo, $user! Sie haben ein Buch.''',
        two: '''Hallo, $user! Du hast zwei Bücher! Weiter so!''',
        few: '''Hallo, $user! Sie haben $howMany Buch! Sehr beeindruckend!''',
        many: '''Hallo, $user! Sie haben $howMany Buch! Sehr beeindruckend!''',
        other: '''Hallo, $user! Sie haben $howMany Buch! Sehr beeindruckend!''',
        desc: '''''',
        precision: precision,
      );
  @override
  final Tooltips tooltips = DeTooltips();
  @override
  final Presidents presidents = DePresidents();
  @override
  final MainView mainView = DeMainView();
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
  /// Example: "Presidents app"
  @override
  final String description = Intl.message(
    '''Presidents app''',
    name: 'description',
    desc: '',
  );
}

class EnTooltips extends Tooltips {
  Map<String, Object?> get _contentMap => {
        'increment': increment,
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
  /// Example: "Increment"
  @override
  final String increment = Intl.message(
    '''Increment''',
    name: 'increment',
    desc: '',
  );
}

class EnPresidents extends Presidents {
  Map<String, Object?> get _contentMap => {
        'p1': p1,
        'p2': p2,
        'p3': p3,
        'p4': p4,
        'p5': p5,
        'p6': p6,
        'p7': p7,
        'p8': p8,
        'p9': p9,
        'p10': p10,
        'p11': p11,
        'p12': p12,
        'p13': p13,
        'p14': p14,
        'p15': p15,
        'p16': p16,
        'p17': p17,
        'p18': p18,
        'p19': p19,
        'p20': p20,
        'p21': p21,
        'p22': p22,
        'p23': p23,
        'p24': p24,
        'p25': p25,
        'p26': p26,
        'p27': p27,
        'p28': p28,
        'p29': p29,
        'p30': p30,
        'p31': p31,
        'p32': p32,
        'p33': p33,
        'p34': p34,
        'p35': p35,
        'p36': p36,
        'p37': p37,
        'p38': p38,
        'p39': p39,
        'p40': p40,
        'p41': p41,
        'p42': p42,
        'p43': p43,
        'p44': p44,
        'p45': p45,
        'p46': p46,
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
  /// Example: "George Washington"
  @override
  final String p1 = Intl.message(
    '''George Washington''',
    name: 'p1',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Adams"
  @override
  final String p2 = Intl.message(
    '''John Adams''',
    name: 'p2',
    desc: '',
  );

  /// Description: ""
  /// Example: "Thomas Jefferson"
  @override
  final String p3 = Intl.message(
    '''Thomas Jefferson''',
    name: 'p3',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Madison"
  @override
  final String p4 = Intl.message(
    '''James Madison''',
    name: 'p4',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Monroe"
  @override
  final String p5 = Intl.message(
    '''James Monroe''',
    name: 'p5',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Quincy Adams"
  @override
  final String p6 = Intl.message(
    '''John Quincy Adams''',
    name: 'p6',
    desc: '',
  );

  /// Description: ""
  /// Example: "Andrew Jackson"
  @override
  final String p7 = Intl.message(
    '''Andrew Jackson''',
    name: 'p7',
    desc: '',
  );

  /// Description: ""
  /// Example: "Martin Van Buren"
  @override
  final String p8 = Intl.message(
    '''Martin Van Buren''',
    name: 'p8',
    desc: '',
  );

  /// Description: ""
  /// Example: "William Henry Harrison"
  @override
  final String p9 = Intl.message(
    '''William Henry Harrison''',
    name: 'p9',
    desc: '',
  );

  /// Description: ""
  /// Example: "John Tyler"
  @override
  final String p10 = Intl.message(
    '''John Tyler''',
    name: 'p10',
    desc: '',
  );

  /// Description: ""
  /// Example: "James K. Polk"
  @override
  final String p11 = Intl.message(
    '''James K. Polk''',
    name: 'p11',
    desc: '',
  );

  /// Description: ""
  /// Example: "Zachary Taylor"
  @override
  final String p12 = Intl.message(
    '''Zachary Taylor''',
    name: 'p12',
    desc: '',
  );

  /// Description: ""
  /// Example: "Millard Fillmore"
  @override
  final String p13 = Intl.message(
    '''Millard Fillmore''',
    name: 'p13',
    desc: '',
  );

  /// Description: ""
  /// Example: "Franklin Pierce"
  @override
  final String p14 = Intl.message(
    '''Franklin Pierce''',
    name: 'p14',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Buchanan"
  @override
  final String p15 = Intl.message(
    '''James Buchanan''',
    name: 'p15',
    desc: '',
  );

  /// Description: ""
  /// Example: "Abraham Lincoln"
  @override
  final String p16 = Intl.message(
    '''Abraham Lincoln''',
    name: 'p16',
    desc: '',
  );

  /// Description: ""
  /// Example: "Andrew Johnson"
  @override
  final String p17 = Intl.message(
    '''Andrew Johnson''',
    name: 'p17',
    desc: '',
  );

  /// Description: ""
  /// Example: "Ulysses S. Grant"
  @override
  final String p18 = Intl.message(
    '''Ulysses S. Grant''',
    name: 'p18',
    desc: '',
  );

  /// Description: ""
  /// Example: "Rutherford B. Hayes"
  @override
  final String p19 = Intl.message(
    '''Rutherford B. Hayes''',
    name: 'p19',
    desc: '',
  );

  /// Description: ""
  /// Example: "James A. Garfield"
  @override
  final String p20 = Intl.message(
    '''James A. Garfield''',
    name: 'p20',
    desc: '',
  );

  /// Description: ""
  /// Example: "Chester A. Arthur"
  @override
  final String p21 = Intl.message(
    '''Chester A. Arthur''',
    name: 'p21',
    desc: '',
  );

  /// Description: ""
  /// Example: "Grover Cleveland"
  @override
  final String p22 = Intl.message(
    '''Grover Cleveland''',
    name: 'p22',
    desc: '',
  );

  /// Description: ""
  /// Example: "Benjamin Harrison"
  @override
  final String p23 = Intl.message(
    '''Benjamin Harrison''',
    name: 'p23',
    desc: '',
  );

  /// Description: ""
  /// Example: "Grover Cleveland"
  @override
  final String p24 = Intl.message(
    '''Grover Cleveland''',
    name: 'p24',
    desc: '',
  );

  /// Description: ""
  /// Example: "William McKinley"
  @override
  final String p25 = Intl.message(
    '''William McKinley''',
    name: 'p25',
    desc: '',
  );

  /// Description: ""
  /// Example: "Theodore Roosevelt"
  @override
  final String p26 = Intl.message(
    '''Theodore Roosevelt''',
    name: 'p26',
    desc: '',
  );

  /// Description: ""
  /// Example: "William H. Taft"
  @override
  final String p27 = Intl.message(
    '''William H. Taft''',
    name: 'p27',
    desc: '',
  );

  /// Description: ""
  /// Example: "Woodrow Wilson"
  @override
  final String p28 = Intl.message(
    '''Woodrow Wilson''',
    name: 'p28',
    desc: '',
  );

  /// Description: ""
  /// Example: "Warren G. Harding"
  @override
  final String p29 = Intl.message(
    '''Warren G. Harding''',
    name: 'p29',
    desc: '',
  );

  /// Description: ""
  /// Example: "Calvin Coolidge"
  @override
  final String p30 = Intl.message(
    '''Calvin Coolidge''',
    name: 'p30',
    desc: '',
  );

  /// Description: ""
  /// Example: "Herbert C. Hoover"
  @override
  final String p31 = Intl.message(
    '''Herbert C. Hoover''',
    name: 'p31',
    desc: '',
  );

  /// Description: ""
  /// Example: "Franklin D. Roosevelt"
  @override
  final String p32 = Intl.message(
    '''Franklin D. Roosevelt''',
    name: 'p32',
    desc: '',
  );

  /// Description: ""
  /// Example: "Harry S. Truman"
  @override
  final String p33 = Intl.message(
    '''Harry S. Truman''',
    name: 'p33',
    desc: '',
  );

  /// Description: ""
  /// Example: "Dwight D. Eisenhower"
  @override
  final String p34 = Intl.message(
    '''Dwight D. Eisenhower''',
    name: 'p34',
    desc: '',
  );

  /// Description: ""
  /// Example: "John F. Kennedy"
  @override
  final String p35 = Intl.message(
    '''John F. Kennedy''',
    name: 'p35',
    desc: '',
  );

  /// Description: ""
  /// Example: "Lyndon B. Johnson"
  @override
  final String p36 = Intl.message(
    '''Lyndon B. Johnson''',
    name: 'p36',
    desc: '',
  );

  /// Description: ""
  /// Example: "Richard M. Nixon"
  @override
  final String p37 = Intl.message(
    '''Richard M. Nixon''',
    name: 'p37',
    desc: '',
  );

  /// Description: ""
  /// Example: "Gerald R. Ford"
  @override
  final String p38 = Intl.message(
    '''Gerald R. Ford''',
    name: 'p38',
    desc: '',
  );

  /// Description: ""
  /// Example: "James Earl Carter"
  @override
  final String p39 = Intl.message(
    '''James Earl Carter''',
    name: 'p39',
    desc: '',
  );

  /// Description: ""
  /// Example: "Ronald Reagan"
  @override
  final String p40 = Intl.message(
    '''Ronald Reagan''',
    name: 'p40',
    desc: '',
  );

  /// Description: ""
  /// Example: "George Bush"
  @override
  final String p41 = Intl.message(
    '''George Bush''',
    name: 'p41',
    desc: '',
  );

  /// Description: ""
  /// Example: "William J. Clinton"
  @override
  final String p42 = Intl.message(
    '''William J. Clinton''',
    name: 'p42',
    desc: '',
  );

  /// Description: ""
  /// Example: "George W. Bush"
  @override
  final String p43 = Intl.message(
    '''George W. Bush''',
    name: 'p43',
    desc: '',
  );

  /// Description: ""
  /// Example: "Barack H. Obama"
  @override
  final String p44 = Intl.message(
    '''Barack H. Obama''',
    name: 'p44',
    desc: '',
  );

  /// Description: ""
  /// Example: "Donald J. Trump"
  @override
  final String p45 = Intl.message(
    '''Donald J. Trump''',
    name: 'p45',
    desc: '',
  );

  /// Description: ""
  /// Example: "Joseph R. Biden, Jr."
  @override
  final String p46 = Intl.message(
    '''Joseph R. Biden, Jr.''',
    name: 'p46',
    desc: '',
  );
}

class EnSecondStoryExample extends SecondStoryExample {
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
  /// Example: "This is a title"
  @override
  final String title = Intl.message(
    '''This is a title''',
    name: 'title',
    desc: '',
  );

  /// Description: ""
  /// Example: "This is a description"
  @override
  final String description = Intl.message(
    '''This is a description''',
    name: 'description',
    desc: '',
  );
}

class EnFirstTabSecondStory extends FirstTabSecondStory {
  Map<String, Object?> get _contentMap => {
        'example': example,
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
  final SecondStoryExample example = EnSecondStoryExample();
}

class EnMainViewFirstTab extends MainViewFirstTab {
  Map<String, Object?> get _contentMap => {
        'secondStory': secondStory,
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
  final FirstTabSecondStory secondStory = EnFirstTabSecondStory();
}

class EnMainView extends MainView {
  Map<String, Object?> get _contentMap => {
        'firstTab': firstTab,
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
  final MainViewFirstTab firstTab = EnMainViewFirstTab();
}

class En extends LocalizationMessages {
  Map<String, Object?> get _contentMap => {
        'app': app,
        'books': books,
        'tooltips': tooltips,
        'presidents': presidents,
        'mainView': mainView,
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
  final App app = EnApp();

  /// Description: ""
  /// Example: "zero: Hello, $user! You have no books., one: Hello, $user! You have a one book., two: Hello, $user! You have two books! Keep it up!, few: Hello, $user! You have $howMany books! Very impressive!, many: null, other: Hello, $user! You have $howMany books! Very impressive!"
  @override
  String books({
    required String user,
    required int howMany,
    int? precision,
  }) =>
      Intl.plural(
        howMany,
        name: '''books''',
        zero: '''Hello, $user! You have no books.''',
        one: '''Hello, $user! You have a one book.''',
        two: '''Hello, $user! You have two books! Keep it up!''',
        few: '''Hello, $user! You have $howMany books! Very impressive!''',
        many: '''Hello, $user! You have $howMany books! Very impressive!''',
        other: '''Hello, $user! You have $howMany books! Very impressive!''',
        desc: '''''',
        precision: precision,
      );
  @override
  final Tooltips tooltips = EnTooltips();
  @override
  final Presidents presidents = EnPresidents();
  @override
  final MainView mainView = EnMainView();
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
    'de': De(),
    'en': En(),
  };
}

class Messages {
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

  static LocalizationMessages get de => LocalizationDelegate()._languageMap['de']!;
  static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
}

final List<LocalizationsDelegate> localizationsDelegates = [
  LocalizationDelegate(),
  ...GlobalMaterialLocalizations.delegates
];

const List<Locale> supportedLocales = [
  Locale('de'),
  Locale('en'),
];
