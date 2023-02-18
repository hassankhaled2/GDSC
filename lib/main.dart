import 'package:flutter/material.dart';
import 'package:gdsc/register_screen/register_screen.dart';

import 'login/login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:RegisterScreen()

    );
  }
}

