import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:dynamic_gpa_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterGradeSelected;
  LetterDropdownWidget({required this.onLetterGradeSelected, Key? key})
      : super(key: key);

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}


class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  
  double selectedLetterGrade = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.dropDownPaddingAmount,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      // ignore: prefer_const_literals_to_create_immutables
      child: DropdownButton<double>(
        value: selectedLetterGrade,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedLetterGrade = value!;
            widget.onLetterGradeSelected(selectedLetterGrade);

            // print(value);
          });
        },
        underline: Container(),
        // ignore: prefer_const_literals_to_create_immutables
        items: DataHelper.lettersOfAllLectures(),
      ),
    );
  }
}
