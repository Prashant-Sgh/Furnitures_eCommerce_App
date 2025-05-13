import 'package:flutter/material.dart';
import 'screens/homePage.dart';

void main() {
  runApp(MaterialApp(
    title: 'eCommerce App',
    initialRoute: HomePage.id,
    routes: {HomePage.id: (context) => HomePage()},
  ));
}
