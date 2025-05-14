import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'eCommerce App',
    initialRoute: HomeScreen.id,
    routes: {HomeScreen.id: (context) => HomeScreen()},
  ));
}
