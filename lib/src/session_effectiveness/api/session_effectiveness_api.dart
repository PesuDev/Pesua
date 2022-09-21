import 'dart:convert';
import 'dart:developer';

import 'package:pesu/src/session_effectiveness/model/session_effectiveness.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';

class SessionEffectivenessApi {

  late final PesuApiService _pesuApiService = PesuApiService();

  Future<SessionEffectivenessModel?> fetchSessionDetail({
    required int action,
    required int mode,
    required double randomNum,
    required String userId,
    required int dayNumber,
  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
      'action': action,
      'mode': mode,
      'userId': userId,
      'randomNum': randomNum,
      'dayNumber': dayNumber
    });
    if (data != null) {
      return SessionEffectivenessModel.fromJson(data);
    }

    log("monday$data");




  }
}

class FeedbackApi {
  late final PesuApiService _pesuApiService = PesuApiService();

  Future feedbackData({
   required int action,
    required int mode,
    required int subjectId,
    required int status,
    required int BatchId,
    required int BatchClassId,
    required int ClassBatchSectionId,
    required int ClassId,
    required int DepartmentId,
    required int ProgramId,
    required String isLocallySavedData,
    required  String subjectCode,
    required String userId,
    required String timeTableTemplateDetailsId,
    required double randomNum,

  }) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url, params: {
    'action':action,
    'mode':mode,
   'subjectId':subjectId,
    'subjectCode':subjectCode,
    'status':status,
    'userId':userId,
    'BatchClassId':BatchClassId,
    'BatchId':BatchId,
   'ClassBatchSectionId':ClassBatchSectionId,
    'ClassId':ClassId,
    'DepartmentId':DepartmentId,
   'isLocallySavedData':isLocallySavedData,
   'ProgramId':ProgramId,
    'timeTableTemplateDetailsId':timeTableTemplateDetailsId,
   'randomNum':randomNum,


    });
    if (data != null) {

      // return UpdatePasswordModel.fromJson(data);
      log("msg$data");

    }


  }
}
