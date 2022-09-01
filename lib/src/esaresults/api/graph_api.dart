import 'dart:developer';

import 'package:pesu/src/esaresults/model/graph_model.dart';
import 'package:pesu/utils/constants/app_urls.dart';
import 'package:pesu/utils/services/pesu_api_service.dart';
import '../model/esa_model.dart';

class GraphApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<GraphModel?> fetchGraphInfo({
    required int action,
    required int mode,
    required double randomNum,
    required String usn,
    required String subjectCode,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'USN': usn,
      'subjectCode': subjectCode,
      'randomNum': randomNum,
    });
    if (data != null) {
      // Iterable iterable = data;
      return GraphModel.fromJson(data);
    }
    log("Graph Details $data");
  }
}
