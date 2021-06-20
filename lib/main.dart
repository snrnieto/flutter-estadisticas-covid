import 'package:flutter/material.dart';
import 'package:pruebaapi/Screens/splash.dart';
// import 'package:pruebaapi/Screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
