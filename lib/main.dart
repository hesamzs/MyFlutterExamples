import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myflutterproject/Teaching-Examples/api/coinmarketcap/api.dart';
import 'Teaching-Examples/api/coinmarketcap/coinmarketcap_api.dart';
import 'front-page.dart';
import 'package:http/http.dart' as http;

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
      home: FrontPage(),

    );
  }
}

