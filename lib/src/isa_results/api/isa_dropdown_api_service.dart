import 'dart:developer';

import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/app_routes.dart';
import '../../../utils/services/pesu_api_service.dart';

class IsaDropDownApiService {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future<List<Isa_downdown_model>?> fetchIsaDropDwnDetails(
      {required int action,
      required int mode,
      required String whichObjectId,
      required String title,
      required String userId,
      required int deviceType,
      required int serverMode,
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
      'redirectValue': redirectValue,
      'randomNum': randomNum
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => Isa_downdown_model.fromJson(e)).toList();
    }
    log("IsaResultsLog $data");
    // return data;
  }
}