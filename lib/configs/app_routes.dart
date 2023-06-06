import 'package:flutter/material.dart';
import 'package:rallymobile/screens/screens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return LoadingScreen.route();
      case LoadingScreen.routeName:
        return LoadingScreen.route();
      default:
        return _errorRoute();
    }
  }

  Route? _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
