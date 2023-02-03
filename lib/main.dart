import 'package:flutter/material.dart';
import 'front-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[600],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850]
      )),
      debugShowCheckedModeBanner: false,
      home: const FrontPage(),

    );
  }
}

