import 'package:flutter/material.dart';
import 'package:uts/dassboard/head.dart';
import 'package:uts/login/login.dart';
import 'package:uts/login/register.dart';
import 'package:uts/views/headAdmin.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Head());
      case 'head':
        return MaterialPageRoute(builder: (_) => const Head());
      case 'headAdmin':
        return MaterialPageRoute(builder: (_) => const HeadAdmin());
      case 'login':
        return MaterialPageRoute(builder: (_) => const Login());
      case 'register':
        return MaterialPageRoute(builder: (_) => const Register());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text('Error Page')),
      );
    });
  }
}
