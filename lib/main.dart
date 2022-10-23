import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: LoginPage(),
    );
  }
}
