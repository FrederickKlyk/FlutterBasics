import 'package:demo1/routes/NavDrawerRoutes.dart';
import 'package:demo1/ui/pageb/PageB.dart';
import 'package:flutter/material.dart';

import 'Counter.dart';

/// A [MaterialApp] which sets the `home` to [CounterPage].
class CounterApp extends MaterialApp {
  CounterApp({Key? key})
      : super(
            key: key,
            title: "Meine Counter App",
            home: CounterPage(),
            routes: {
              NavDrawerRoutes.counterpage: (context) => CounterApp(),
              NavDrawerRoutes.pageb: (context) => PageB(),
            });

  @override
  ThemeData? get theme => ThemeData(primarySwatch: Colors.green);
}
