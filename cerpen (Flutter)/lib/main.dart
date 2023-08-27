import 'package:flutter/material.dart';
import 'package:uts/routes.dart';

void main() {
  // runApp(const MyApp());
  runApp(const MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
