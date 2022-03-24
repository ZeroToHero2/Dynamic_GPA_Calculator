import 'package:dynamic_gpa_app/model/course.dart';
import 'package:dynamic_gpa_app/widgets/calculate_average._page.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Course> allAddedCourses = [];
  static addCourse(Course course) {
    allAddedCourses.add(course);
  }

  static List<String> _allCourseGrades() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FF"];
  }

  static double _ConvertLetterToNumber(String letter) {
    switch (letter) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> lettersOfAllLectures() {
    return _allCourseGrades()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _ConvertLetterToNumber(e),
            ))
        .toList();
  }

  static List<int> _possibleCreditsOfCourses() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditsOfCourses() {
    //In order to COnvert the Credits to DropDownMenu Items.
    return _possibleCreditsOfCourses()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }

  static double calculateAverage() {
    double sumOfNotes = 0;
    double sumOfCredits = 0;
    allAddedCourses.forEach((element) {
      sumOfNotes += (element.creditValue * element.LetterValue);
      sumOfCredits += element.creditValue;
    });
    return sumOfNotes / sumOfCredits;
  }
}
