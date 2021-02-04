import 'package:flutter/material.dart';
import 'package:flutter_apptest1/Hal1.dart';
import 'package:flutter_apptest1/Navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: Navbar(),
    );
  }
}
