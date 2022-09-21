
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:pesu/src/time_table/api/timeTable_api.dart';
import 'package:pesu/src/time_table/model/time_table_model.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';

class TimeTableViewmodel extends ChangeNotifier {
  late final TimeTableApi _apiService = TimeTableApi();
 List <TimeTableModel>? timeTableModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();


  void getTimeTableDetails(
      {required int action,required int mode,
        required double randomNum, required String callMethod })
  async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _apiService.fetchTimeTableDetails(action: action,mode:
    mode,userId: userId.toString(),randomNum:randomNum,callMethod: callMethod);

    timeTableModel = data;

    notifyListeners();

  }

}
