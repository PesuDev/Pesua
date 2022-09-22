import 'package:flutter/cupertino.dart';
import 'package:pesu/src/courses/api/courseApiService.dart';

import 'package:pesu/src/courses/model/courseModel.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/courseDropDownModel.dart';
import '../model/subjectModel.dart';
import '../model/unitModel.dart';

class CourseViewModel extends ChangeNotifier {
  final CourseApiService _courseDropDownApiService = CourseApiService();
  final CourseApiService _courseApiService = CourseApiService();
  final CourseApiService _subjectAPiService = CourseApiService();
  final CourseApiService _unitApiService = CourseApiService();
  List<CourseDropDownModel>? courseDropDownModel;
  CourseModel? courseModel;
  List<STUDENTSUBJECTS>? studentSubjects;
  SubjectModel? subjectModel;
  List<COURSECONTENT>? courseContent;

  List<UnitModel>? unitModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();


  void getCourseDropDownDetails(
      {required int action,
      required int mode,
      required String whichObjectId,
      required String title,
      required int deviceType,
      required int serverMode,
      required int programId,
      required String redirectValue,
      required double randomNum}) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _courseDropDownApiService.fetchCourseDDDetails(
        action: action,
        mode: mode,
        whichObjectId: whichObjectId,
        title: title,
        userId: userId.toString(),
        deviceType: deviceType,
        serverMode: serverMode,
        programId: programId,
        redirectValue: redirectValue,
        randomNum: randomNum);
    courseDropDownModel = data;

    notifyListeners();
  }

  void getCourseDetails(
      {required int action,
      required int mode,
      required int batchClassId,
      required int classBatchSectionId,
      required int programId,
      required int semIndexVal,
      required double randomNum}) async {
    String? userId=await preferenceUtil.getString(sp_userId);
    String? classId=await preferenceUtil.getString(sp_classId);
    String? classBatchSectionId=await preferenceUtil.getString(sp_classBatchSectionId);
    String? batchClassId=await preferenceUtil.getString(sp_batchClassId);


    final data = await _courseApiService.fetchCourseDetails(
        action: action,
        mode: mode,
        batchClassId: int.parse(batchClassId.toString()),
        classBatchSectionId: int.parse(classBatchSectionId.toString()),
        classId: int.parse(classId.toString()),
        userId: userId.toString(),
        programId: programId,
        semIndexVal: semIndexVal,
        randomNum: randomNum);
    courseModel = data;

    notifyListeners();
  }

  void getSubjectContentDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required String subjectName,
      required double randomNum}) async {
    final data = await _subjectAPiService.fetchSubjectContent(
        action: action,
        mode: mode,
        subjectId: subjectId,
        subjectName: subjectName,
        randomNum: randomNum);
    subjectModel = data;

    notifyListeners();
  }

  void getUnitDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required int ccId,
      required double randomNum}) async {
    final data = await _unitApiService.fetchUnitDetails(
        action: action,
        mode: mode,
        subjectId: subjectId,
        ccId: ccId,
        randomNum: randomNum);
    unitModel = data;

    notifyListeners();
  }
}
