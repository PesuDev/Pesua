import 'dart:developer';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/subjectModel.dart';

class SubjectAPiService {
  late final PesuApiService _pesuApiService = PesuApiService();

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
}
