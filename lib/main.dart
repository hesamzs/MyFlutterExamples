import 'package:flutter/material.dart';

import 'Teaching-Examples/database/database.dart';
import 'front-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[600],
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850])),
      debugShowCheckedModeBanner: false,
      home: Page(),
    );
  }
}


class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {

  Database database = Database();

  @override
  void initState() {
    super.initState();
    database.DatabaseClass();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello"),),
    );
  }
}

