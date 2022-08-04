import 'package:flutter/cupertino.dart';
import 'package:pesu/src/courses/api/courseDropDownApiService.dart';

import '../model/courseDropDownModel.dart';

class CourseDropDownViewModel extends ChangeNotifier {
  final CourseDropDownApiService _courseDropDownApiService =
      CourseDropDownApiService();
  List<CourseDropDownModel>? courseDropDownModel;

  void getCourseDropDownDetails(
      {required int action,
      required int mode,
      required String whichObjectId,
      required String title,
      required String userId,
      required int deviceType,
      required int serverMode,
      required int programId,
      required String redirectValue,
      required double randomNum}) async {
    final data = await _courseDropDownApiService.fetchCourseDDDetails(
        action: action,
        mode: mode,
        whichObjectId: whichObjectId,
        title: title,
        userId: userId,
        deviceType: deviceType,
        serverMode: serverMode,
        programId: programId,
        redirectValue: redirectValue,
        randomNum: randomNum);
    courseDropDownModel = data;

    notifyListeners();
  }
}
