import 'dart:developer';

import 'package:pesu/src/courses/model/courseDropDownModel.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';

import '../../../utils/constants/app_urls.dart';

class CourseDropDownApiService {
  late final PesuApiService pesuApiService = PesuApiService();

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
    final data = await pesuApiService.postApiCall(endPoint: url, params: {
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
}
