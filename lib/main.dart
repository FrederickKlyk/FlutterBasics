import 'package:demo1/CounterBloc.dart';
import 'package:demo1/MyHomePage.dart';
import 'package:demo1/di/GetItInitializer.dart';
import 'package:flutter/material.dart';

import 'ui/counter/CounterApp.dart';
import 'ui/counter/CounterEvent.dart';

void main() {
  GetItInitializer().setup();

  runApp(CounterApp());
}













@deprecated
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyButton extends StatelessWidget {
  final CounterBloc counterBloc;

  MyButton(this.counterBloc);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        "Mein Button",
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      onPressed: _incrementCounter2,
      textColor: Colors.red,
      color: Colors.green,
    );
  }

  void _incrementCounter2() {
    counterBloc.eventSink.add(CounterEvent.Increment);
  }
}
