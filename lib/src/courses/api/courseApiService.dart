import 'dart:developer';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/courseModel.dart';

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
}
