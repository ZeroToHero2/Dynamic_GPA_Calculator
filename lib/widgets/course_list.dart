// ignore_for_file: avoid_unnecessary_containers

import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:dynamic_gpa_app/helper/data_helper.dart';
import 'package:dynamic_gpa_app/model/course.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  const CourseList({required this.onDeletingCourse, Key? key})
      : super(key: key);
  final Function onDeletingCourse; //Self-generated Func.

  @override
  Widget build(BuildContext context) {
    List<Course> allLectures = DataHelper.allAddedCourses;
    return allLectures.length > 0
        ? ListView.builder(
            itemCount: DataHelper.allAddedCourses.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (arg) {
                  onDeletingCourse(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(allLectures[index].courseName),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          (allLectures[index].LetterValue *
                                  allLectures[index].creditValue)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${allLectures[index].creditValue} Credit, Grade ${allLectures[index].LetterValue}"),
                    ),
                  ),
                ),
              );
            }),
          )
        : Container(
            child: Center(
              child: Text(
                "Please Add a Course",
                style: Constants.titleStyle,
              ),
            ),
          );
  }
}
