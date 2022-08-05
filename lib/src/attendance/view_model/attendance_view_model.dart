import 'package:flutter/cupertino.dart';
import 'package:pesu/src/attendance/api_services/attendace_api_services.dart';

class AttendanceViewModel extends ChangeNotifier {
  late final AttendanceApiServices _apiService = AttendanceApiServices();




  void  getAttendanceDropDown(
      // {required int action,
      //   required int mode,
      //   required String userId,
      //   required double randomNum,}
      ) async {
    final data = await _apiService.fetchAttendanceDropDownInfo();
   // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
//    esaModel2 = data;
    //notifyListeners();
  }

  void  getAttendanceListInfo(
      // {required int action,
      //   required int mode,
      //   required String userId,
      //   required double randomNum,}
      ) async {
    final data = await _apiService.fetchAttendanceListInfo();
    // this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
//    esaModel2 = data;
    //notifyListeners();
  }

}