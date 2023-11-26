import 'package:flutter/material.dart';
import '../view/forgot_password_screen.dart';
import '../view/login_screen.dart';
import '../view/registration_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RegisterScreen.id:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case ForgotPasswordScreen.id:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      default:
        return null;
    }
  }
}
