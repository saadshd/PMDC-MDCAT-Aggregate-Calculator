import 'package:merit_calculator/model/college_model.dart';
import 'package:merit_calculator/utils/college_list.dart';

class Utils {

  static List<College> getCollegesByAggregate(double userAggregate) {
    return collegeList.where((college) => college.merit <= userAggregate).toList();
  }

}