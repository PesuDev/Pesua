import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';
import 'package:pesu/src/attendance/model/detailed_attendance_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/pesu_api_service.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/attendance_dropdown_model.dart';

class AttendanceApiServices {
  late final PesuApiService _pesuApiService = PesuApiService();
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();





  Future <List<AttendanceDropDownModel>?>fetchAttendanceDropDownInfo(
  ) async {
    String url = AppUrls.commonUrl;
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
        "action":18,
        "mode":1,
        "whichObjectId":"clickHome_pesuacademy_attendance",
        "title":"Attendance",
       "userId":userId,
        "deviceType":1,
        "serverMode":0,
        "programId":6,
        "redirectValue":"redirect:/a/ad",
        "randomNum":0.39545290298868396


    }
    );

    log("response:${data.toString()}");
    if (data != null) {
      final Iterable json = data;
      return json.map((e) => AttendanceDropDownModel.fromJson(e)).toList();

    }
  }
  Future<AttendanceListModel?> fetchAttendanceListInfo(
  {required bool isDynamic, int? batchId}
      ) async {
    String url = AppUrls.commonUrl;
    String? userId=await preferenceUtil.getString(sp_userId);
    String? batchClassId=await preferenceUtil.getString(sp_batchClassId);

    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
          "action":18,
          "mode":6,
          "batchClassId":isDynamic?batchId:int.parse(batchClassId.toString()),
          "userId":userId,
          "semIndexVal":0,
          "randomNum":0.35304028500236595
        }
    );
    log("response:${data.toString()}");
    if (data != null) {
       return AttendanceListModel.fromJson(data);
    }
  }




  Future<List<DetailedAttendanceModel>?> subjectAttendance({required bool isDynamic,int? batchId,int? classBatchSectionIdnew,int? subId}
      // int subjectId,int batchClassId,int classBatchId,
      ) async {
    String url = AppUrls.commonUrl;
    String? userId=await preferenceUtil.getString(sp_userId);
    String? batchClassId=await preferenceUtil.getString(sp_batchClassId);
    String? classBatchSectionId=await preferenceUtil.getString(sp_classBatchSectionId);
    print("iski${classBatchSectionId}");
    print("othername${batchClassId}");


    final data = await _pesuApiService.postApiCall(endPoint: url,
        params: {
          "action":18,
          "mode":16,
          "subjectId":isDynamic?subId:13892,
          "idType":1,
          "userId":userId,
         "batchClassId":isDynamic?batchId:int.parse(batchClassId.toString()),
          "classBatchSectionId":isDynamic?classBatchSectionIdnew:classBatchSectionId,
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