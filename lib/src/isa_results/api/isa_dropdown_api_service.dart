import 'dart:developer';

import 'package:pesu/src/isa_results/model/isaGraphModel.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/app_routes.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/isaResultModel.dart';

class IsaResultApiService {
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

  Future<List<IsaResultModel>?> fetchIsaResultDetails(
      {required int action,
      required int mode,
      required int batchClassId,
      required int classBatchSectionId,
      required String fetchId,
      required String userId,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'batchClassId': batchClassId,
      'classBatchSectionId': classBatchSectionId,
      'fetchId': fetchId,
      'userId': userId,
      'randomNum': randomNum
    });
    if (data != null) {
      Iterable iterable = data;
      return iterable.map((e) => IsaResultModel.fromJson(e)).toList();
    }
    log("IsaResultsLog $data");
    // return data;
  }

  Future<IsaGraphModel?> fetchIsaGraphDetails(
      {required int action,
      required int mode,
 int? subjectId,
      required String fetchId,
      required String subjectCode,
      required String subjectName,
      required String userId,
      required String loginId,
      required double randomNum}) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'subjectId': subjectId,
      'fetchId': fetchId,
      'subjectCode': subjectCode,
      'subjectName': subjectName,
      'userId': userId,
      'loginId': loginId,
      'randomNum': randomNum
    });
    if (data != null) {
      //log("Data >>>   $data}");
      return IsaGraphModel.fromJson(data);
    }
    log("IsaResultsLog $data");
    // return data;
  }
}
