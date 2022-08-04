import 'package:flutter/cupertino.dart';
import 'package:pesu/src/seatinginfo/api/seating_info_api.dart';

import '../model/seating_info_model.dart';

class SeatingInfoViewModel extends ChangeNotifier {
  late final SeatingInfoApi _apiService = SeatingInfoApi();
  List<SeatingInfoModel>? seatingInfoModel;

  void getSeatingInfoDetails(
      {required int action,
      required int mode,
      required String userId,
      required String callMethod,
      required double randomNum,}) async {
    final data = await _apiService.fetchSeatingInfoDetails(
        action: action,
        mode: mode,
        userId: userId,
        randomNum: randomNum,
        callMethod: callMethod);

     seatingInfoModel = data;
    notifyListeners();
  }
}
