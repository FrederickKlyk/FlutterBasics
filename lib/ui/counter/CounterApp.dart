import 'Counter.dart';
import 'package:flutter/material.dart';

/// A [MaterialApp] which sets the `home` to [CounterPage].
class CounterApp extends MaterialApp{
  CounterApp({Key? key}) : super(key: key, title: "Meine Counter App", home: CounterPage());

  @override
  ThemeData? get theme => ThemeData(primarySwatch: Colors.green);
}