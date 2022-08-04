

import 'dart:developer';

import 'package:pesu/src/time_table/model/time_table_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';

class TimeTableApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<List<TimeTableModel>?> fetchTimeTableDetails({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
    required String callMethod,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'userId': userId,
      'randomNum': randomNum,
      'callMethod': callMethod
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => TimeTableModel.fromJson(e)).toList();

    }
    // log('HII'${data.toString()});
    log("msg$data");


  }
}