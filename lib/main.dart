import 'package:flutter/material.dart';
import 'package:healthy_food/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Food',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Poppins'),
      home: HomeScreen(),
    );
  }
}
