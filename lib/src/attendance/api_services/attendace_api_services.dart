import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';
import 'package:pesu/src/attendance/model/detailed_attendance_model.dart';

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




  Future<List<DetailedAttendanceModel>?> subjectAttendance(
      // int subjectId,int batchClassId,int classBatchId,
      ) async {
    String url = AppUrls.commonUrl;
    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
          "action":18,
          "mode":16,
          "subjectId":13892,
          "idType":1,
          "userId":"7b14a7f5-13a7-4c1c-a17d-42e7ac9a147f",
         "batchClassId":1400,
          "classBatchSectionId":4164,
         " subjectInfo":"1503&&4378&&42&&46&&UE21EC642A&&Analog VLSI &&91.3",
          "randomNum":0.8549240905984299
        }
    );

if(data !=null) {
  final Iterable json = data;
  return json.map((orderModel) => DetailedAttendanceModel.fromJson(orderModel))
      .toList();
}
    // //final Map<String,dynamic> dataValue=data as Map<String,dynamic>;
    // log("response:${data.toString()}");
    // if (data != null) {
    //   return DetailedAttendanceModel.fromJson(data);
    }



}