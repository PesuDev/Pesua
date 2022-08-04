
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pesu/src/time_table/api/timeTable_api.dart';
import 'package:pesu/src/time_table/model/time_table_model.dart';

class TimeTableViewmodel extends ChangeNotifier {
  late final TimeTableApi _apiService = TimeTableApi();
 List <TimeTableModel>? timeTableModel;

  void getTimeTableDetails(
      {required int action,required int mode, required String userId,required double randomNum, required String callMethod })
  async {
    final data = await _apiService.fetchTimeTableDetails(action: action,mode:
    mode,userId: userId,randomNum:randomNum,callMethod: callMethod);

    timeTableModel = data;

    notifyListeners();

  }

}
