import 'package:merit_calculator/model/college_model.dart';
import 'package:merit_calculator/utils/college_list.dart';
import 'package:flutter/material.dart';

class Utils {

  static List<College> getCollegesByAggregate(double userAggregate) {
    return collegeList.where((college) => college.merit <= userAggregate).toList();
  }

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

}