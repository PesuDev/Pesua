import 'dart:developer';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/courseDropDownModel.dart';
import '../model/courseModel.dart';
import '../model/subjectModel.dart';
import '../model/unitModel.dart';

class CourseApiService {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<CourseModel?> fetchCourseDetails(
      {required int action,
      required int mode,
      required int batchClassId,
      required int classBatchSectionId,
      required int classId,
      required String userId,
      required int programId,
      required int semIndexVal,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'batchClassId': batchClassId,
      'classBatchSectionId': classBatchSectionId,
      'classId': classId,
      'userId': userId,
      'programId': programId,
      'semIndexVal': semIndexVal,
      'randomNum': randomNum
    });
    if (data != null) {
      // Iterable iterable = data;
      return CourseModel.fromJson(data);
    }
    log("IsaResultsLog $data");
    // return data;
  }

  Future<List<CourseDropDownModel>?> fetchCourseDDDetails(
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
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'whichObjectId': whichObjectId,
      'title': title,
      'userId': userId,
      'deviceType': deviceType,
      'serverMode': serverMode,
      'programId': programId,
      'redirectValue': redirectValue,
      'randomNum': randomNum
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => CourseDropDownModel.fromJson(e)).toList();
    }
    log("CourseDropDownDetails $data");
  }

  Future<SubjectModel?> fetchSubjectContent(
      {required int action,
      required int mode,
      required int subjectId,
      required String subjectName,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'randomNum': randomNum
    });
    if (data != null) {
      return SubjectModel.fromJson(data);
    }
    log("SubjectDetail $data");
  }

  Future<List<UnitModel>?> fetchUnitDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required int ccId,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'subjectId': subjectId,
      'ccId': ccId,
      'randomNum': randomNum
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => UnitModel.fromJson(e)).toList();
    }
  }
}
