import 'package:flutter/material.dart';
import 'package:victech_invoice/home.dart';
import 'package:victech_invoice/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Victech Invoice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade600),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
