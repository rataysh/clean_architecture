import 'package:auth_test_task/data/repositories/auth/auth_repository.dart';
import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:auth_test_task/data/local/local_storage_service.dart';
import 'package:auth_test_task/routing/navigation/navigation_config.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initialize();

  final authRepository = AuthRepository();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(authRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: configureInitialRoute(),
      routes: configureRoutes(),
    );
  }
}
