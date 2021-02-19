import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/admin_tabs_root.dart';
import 'package:flutter_application_1/screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/admin-or-user':
        return MaterialPageRoute(builder: (_) => AdminOrUser());
      case '/admin/login':
        return MaterialPageRoute(builder: (_) => AdminLogin());
      case '/admin/dashboard':
        return MaterialPageRoute(builder: (_) => AdminTabsRoot());
      case '/user/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/user/login':
        return MaterialPageRoute(builder: (_) => UserLogin());
    }
  }
}
