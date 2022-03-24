// ignore_for_file: prefer_const_constructors

import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AverageShow extends StatelessWidget {
  final double average;
  final int courseCount;
  const AverageShow(
      {required this.average, required this.courseCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          courseCount > 0 ? "$courseCount Course Added:" : "Select Course",
          style: Constants.showAverageLittleStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.averageStyle,
        ),
        Text(
          "Average",
          style: Constants.showAverageLittleStyle,
        )
      ],
    );
  }
  
}
