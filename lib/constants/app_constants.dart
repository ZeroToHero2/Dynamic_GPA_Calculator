// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.indigo;
  static const String titleText = "Calculate Average";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);
  static final BorderRadius borderRadius = BorderRadius.circular(16); //24
  static final TextStyle showAverageLittleStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);
  static final EdgeInsets dropDownPaddingAmount =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final horizontalPadding = EdgeInsets.symmetric(horizontal: 8);
}
