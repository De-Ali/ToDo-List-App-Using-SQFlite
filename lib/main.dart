import 'package:flutter/material.dart';
import 'package:sqflite_project/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sqflite Project ',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:  HomeScreen(),
    );
  }
}


