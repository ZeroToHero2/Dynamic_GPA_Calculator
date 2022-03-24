// ignore_for_file: prefer_const_constructors

import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:dynamic_gpa_app/widgets/calculate_average._page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculate Your GPA",
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: CalculateAveragePage(),
    );
  }
}
