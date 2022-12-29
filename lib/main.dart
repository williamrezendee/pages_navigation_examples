import 'package:flutter/material.dart';
import 'package:pages_navigation/views/page_one.dart';
import 'package:pages_navigation/page_two.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const PageOne(),
        '/pageTwo': (_) => const PageTwo(),
      },
    );
  }
}
