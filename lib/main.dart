import 'package:flutter/material.dart';
import 'package:lesson_1/second_page.dart';
import 'apple_ui.dart';
import 'home_page.dart';
import 'intro2_page.dart';
import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Intro2Page(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
