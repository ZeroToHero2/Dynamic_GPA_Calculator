// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:dynamic_gpa_app/helper/data_helper.dart';
import 'package:dynamic_gpa_app/model/course.dart';
import 'package:dynamic_gpa_app/widgets/average_show.dart';
import 'package:dynamic_gpa_app/widgets/course_list.dart';
import 'package:dynamic_gpa_app/widgets/credit_dropdown_widget.dart';
import 'package:dynamic_gpa_app/widgets/letter_dropdown_widget.dart';
import 'package:flutter/material.dart';

class CalculateAveragePage extends StatefulWidget {
  const CalculateAveragePage({Key? key}) : super(key: key);

  @override
  _CalculateAveragePageState createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  @override
  void initState() {
    // TODO: implement initState
  }
  var formKey = GlobalKey<FormState>();
  String enteredCourseName = "";
  double selectedLetterGrade = 4;
  double selectedCredit = 4;
  @override
  Widget build(BuildContext context) {
    print("scaffold run");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Constants.titleText,
              style: Constants.titleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                // ignore: prefer_const_constructors
                Expanded(
                  flex: 1,
                  // ignore: prefer_const_constructors
                  child: AverageShow(
                      courseCount: DataHelper.allAddedCourses.length,
                      average: DataHelper.calculateAverage()),
                ),
              ],
            ),
            Expanded(
              child: CourseList(
                onDeletingCourse: (index) {
                  setState(() {
                    DataHelper.allAddedCourses.removeAt(index);
                  });
                  print("Course Deleted $index");
                },
              ),
            ),

            //form
            //Liste
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Constants.horizontalPadding,
          child: _buildTextFormField(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: Constants.horizontalPadding,
                child: LetterDropdownWidget(onLetterGradeSelected: (letter) {
                  selectedLetterGrade = letter;
                }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Constants.horizontalPadding,
                child: CreditDropDownWidget(onCreditSelected: (credit) {
                  selectedCredit = credit;
                }),
              ),
            ),
            IconButton(
              onPressed: addCourseAndCalculateAverage,
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Constants.mainColor,
              iconSize: 30,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        )
      ]),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Please Enter The Course Name:",
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.2),
      ),
      validator: (str) {
        if (str!.isEmpty) {
          return "Please Enter the Lecture Name";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        setState(() {
          enteredCourseName = value!;
        });
      },
    );
  }

  void addCourseAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // ignore: unnecessary_new
      var addedCourse = new Course(
          courseName: enteredCourseName,
          creditValue: selectedCredit,
          LetterValue: selectedLetterGrade);
      //print(addedCourse);
      setState(() {
        DataHelper.addCourse(addedCourse);
      });
      // print(DataHelper.allAddedCourses);
    } else {}
  }
}
