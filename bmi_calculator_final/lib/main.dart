import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF090C22),
        scaffoldBackgroundColor: const Color(0xFF090C22),
      ),
      home: InputPage(),
    );
  }
}
