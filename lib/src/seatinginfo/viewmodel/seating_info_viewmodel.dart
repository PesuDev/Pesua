import 'package:flutter/cupertino.dart';
import 'package:pesu/src/seatinginfo/api/seating_info_api.dart';

import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../model/seating_info_model.dart';

class SeatingInfoViewModel extends ChangeNotifier {
  late final SeatingInfoApi _apiService = SeatingInfoApi();
  List<SeatingInfoModel>? seatingInfoModel;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();


  void getSeatingInfoDetails(
      {required int action,
      required int mode,
      required String callMethod,
      required double randomNum,}) async {
    String? userId=await preferenceUtil.getString(sp_userId);

    final data = await _apiService.fetchSeatingInfoDetails(
        action: action,
        mode: mode,
        userId: userId.toString(),
        randomNum: randomNum,
        callMethod: callMethod);

     seatingInfoModel = data;
    notifyListeners();
  }
}
