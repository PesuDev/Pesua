import 'package:flutter/cupertino.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';

import '../api/isa_dropdown_api_service.dart';

class IsaDropDownViewModel extends ChangeNotifier {
  final IsaDropDownApiService _isaDropDownApiService = IsaDropDownApiService();
  List<Isa_downdown_model>? isaDropDownModel;

  void getIsaDropDownDetails(
      {required int action,
      required int mode,
      required String whichObjectId,
      required String title,
      required String userId,
      required int deviceType,
      required int serverMode,
      required String redirectValue,
      required double randomNum}) async {
    final data = await _isaDropDownApiService.fetchIsaDropDwnDetails(
        action: action,
        mode: mode,
        whichObjectId: whichObjectId,
        title: title,
        userId: userId,
        deviceType: deviceType,
        serverMode: serverMode,
        redirectValue: redirectValue,
        randomNum: randomNum);
    isaDropDownModel = data;

    notifyListeners();
  }
}
