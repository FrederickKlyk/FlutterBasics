import 'package:demo1/di/database_module.dart';
import 'package:flutter/material.dart';

import 'di/domain_module.dart';
import 'di/ui_module.dart';
import 'ui/counter/CounterApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDIModules();

  runApp(CounterApp());
}

Future<void> initializeDIModules() async {
  await registerDatabaseModule();
  registerDomainModule();
  registerUiModule();
}
