import 'package:flutter/material.dart';
import 'package:todos_app/new_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewSplashScreen(),
    );
  }
}
