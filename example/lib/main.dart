import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yalo_locale/lib.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kReleaseMode == false,
      availableLocales: supportedLocales,
      tools: const [
        DeviceSection(
          orientation: false,
          frameVisibility: false,
        ),
        SystemSection(
          theme: false,
        ),
      ],
      builder: (BuildContext context) => const PresidentsApp(),
    ),
  );
}

class PresidentsApp extends StatelessWidget {
  const PresidentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      locale: DevicePreview.locale(context),
      onGenerateTitle: (BuildContext context) => Messages.of(context).app.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 46) {
        _counter = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);
    final String title = loc
        .getContent<MainView>('mainView')
        .getContent<MainViewFirstTab>('firstTab')
        .getContent<FirstTabSecondStory>('secondStory')
        .getContent<SecondStoryExample>('example')
        .getContent('title');

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
}
