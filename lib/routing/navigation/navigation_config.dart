import 'package:flutter/material.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_screen.dart';
import 'package:auth_test_task/ui/auth/singup/widgets/signup_screen.dart';
import 'package:auth_test_task/ui/home/widgets/home_screen.dart';
import 'package:auth_test_task/routing/authentication_check.dart';

// Функция для определения маршрутов
Map<String, WidgetBuilder> configureRoutes() {
  return {
    '/': (context) => const AuthenticationCheck(),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const AuthSignUp(),
    '/home': (context) => const HomeScreen(),
  };
}

// Функция для определения начального маршрута
String configureInitialRoute() {
  return '/';
}
