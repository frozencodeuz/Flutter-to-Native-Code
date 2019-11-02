import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel('flutter.native.code/example');
  String _message;

  @override
  void initState() {
    _message = 'Hello Yudi Setiawan, from Flutter code';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter to Native Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Tap Me'),
              onPressed: () async {
                  try {
                    _message = await platform.invokeMethod('greetingFromNativeCode');
                  } on PlatformException catch (e) {
                    _message = 'Failed to invoke: ${e.message}';
                  }
                  setState(() {});
              },
            ),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
