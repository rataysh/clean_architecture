import 'package:auth_test_task/routing/navigation/navigation_config.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:auth_test_task/data/local/local_storage_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      routes: configureRoutes(),
    );
  }
}
