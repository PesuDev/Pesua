import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../model/attendance_dropdown_model.dart';

class AttendanceApiServices {
  late final PesuApiService _pesuApiService = PesuApiService();




  Future <AttendanceDropDownModel?>fetchAttendanceDropDownInfo(
  ) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
        "action":18,
        "mode":1,
        "whichObjectId":"clickHome_pesuacademy_attendance",
        "title":"Attendance",
       "userId":"7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
        "deviceType":1,
        "serverMode":0,
        "programId":6,
        "redirectValue":"redirect:/a/ad",
        "randomNum":0.39545290298868396


    }
    );

    log("response:${data.toString()}");
    if (data != null) {
      return AttendanceDropDownModel.fromJson(data[0]);
    }
  }
  Future<AttendanceListModel?> fetchAttendanceListInfo(
      ) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
          "action":18,
          "mode":6,
          "batchClassId":1503,
          "userId":"7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
          "semIndexVal":0,
          "randomNum":0.35304028500236595
        }
    );
    log("response:${data.toString()}");
    if (data != null) {
       return AttendanceListModel.fromJson(data);
    }
  }
}