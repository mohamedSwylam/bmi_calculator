import 'package:bmi_calculator_am/bmi_screen.dart';
import 'package:flutter/material.dart';
void main()  {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BmiScreen(),
    );
  }
}
