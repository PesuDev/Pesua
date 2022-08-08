import 'package:flutter/cupertino.dart';
import 'package:pesu/src/courses/api/courseApiService.dart';
import 'package:pesu/src/courses/api/courseDropDownApiService.dart';

import 'package:pesu/src/courses/model/courseModel.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseApiService _courseApiService = CourseApiService();
  CourseModel? courseModel;
  List<STUDENTSUBJECTS>? studentSubjects;

  void getCourseDetails(
      {required int action,
      required int mode,
      required int batchClassId,
      required int classBatchSectionId,
      required int classId,
      required String userId,
      required int programId,
      required int semIndexVal,
      required double randomNum}) async {
    final data = await _courseApiService.fetchCourseDetails(
        action: action,
        mode: mode,
        batchClassId: batchClassId,
        classBatchSectionId: classBatchSectionId,
        classId: classId,
        userId: userId,
        programId: programId,
        semIndexVal: semIndexVal,
        randomNum: randomNum);
    courseModel = data;

    notifyListeners();
  }
}
