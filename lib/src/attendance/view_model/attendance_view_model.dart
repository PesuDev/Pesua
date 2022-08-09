import 'package:flutter/cupertino.dart';
import 'package:pesu/src/attendance/api_services/attendace_api_services.dart';
import 'package:pesu/src/attendance/model/attendance_dropdown_model.dart';
import 'package:pesu/src/attendance/model/attendance_list_model.dart';

class AttendanceViewModel extends ChangeNotifier {
  late final AttendanceApiServices _apiService = AttendanceApiServices();
AttendanceDropDownModel ?attendanceDropDownModel;
AttendanceListModel ?attendanceListModel;


  void  getAttendanceDropDown(

      ) async {
    final data = await _apiService.fetchAttendanceDropDownInfo();
   // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
 attendanceDropDownModel = data;
    notifyListeners();
  }

  void  getAttendanceListInfo(

      ) async {
    final data = await _apiService.fetchAttendanceListInfo();
    // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
attendanceListModel= data;
    notifyListeners();
  }

}