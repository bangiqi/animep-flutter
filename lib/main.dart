import 'package:flutter/material.dart';
import 'feature/main/views/main_tabbar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainTabBarScreen('Home'),
    );
  }
}
