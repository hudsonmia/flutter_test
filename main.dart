import 'package:flutter/material.dart';
import 'package:calculator/app_bar.dart';
import 'package:calculator/body_cal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const Scaffold(
        appBar: Appbar(),
        body: Bodycal(),
      ),
    );
  }
}
