import 'package:dynamic_gpa_app/constants/app_constants.dart';
import 'package:dynamic_gpa_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropDownWidget extends StatefulWidget {
  final Function onCreditSelected;
  CreditDropDownWidget({required this.onCreditSelected, Key? key})
      : super(key: key);

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double selectedCredit = 4;
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
        value: selectedCredit,
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade200,
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
            widget.onCreditSelected(value);
            print(value);
          });
        },
        underline: Container(),
        // ignore: prefer_const_literals_to_create_immutables
        items: DataHelper.allCreditsOfCourses(),
      ),
    );
  }
}
