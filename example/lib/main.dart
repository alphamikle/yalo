import 'package:flutter/material.dart';
import 'package:locale/lib.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: localeDelegates,
      supportedLocales: [
        const Locale('en'),
        const Locale('ru'),
      ],
      title: 'Assets demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(text, textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages _loc = Messages.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${Messages.of(context).book(1)} app'),
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
}
