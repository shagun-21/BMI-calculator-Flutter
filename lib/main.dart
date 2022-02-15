import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color(0xffffffff),
        scaffoldBackgroundColor: Color(0xff009b5b),
        accentColor: Colors.yellow
      ),
      home: InputPage(),
    );
  }
}

