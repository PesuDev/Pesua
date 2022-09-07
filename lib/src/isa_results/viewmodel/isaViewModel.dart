import 'package:flutter/cupertino.dart';
import 'package:pesu/src/isa_results/model/isaResultModel.dart';
import 'package:pesu/src/isa_results/model/isa_dropdown_model.dart';

import '../api/isa_dropdown_api_service.dart';
import '../model/isaGraphModel.dart';

class IsaViewModel extends ChangeNotifier {
  // final IsaDropDownApiService _isaDropDownApiService = IsaDropDownApiService();
  List<Isa_downdown_model>? isaDropDownModel;
  final IsaResultApiService _isaResultApiService = IsaResultApiService();
  List<IsaResultModel>? isaResultModel;
  IsaGraphModel? isaGraphModel;

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
    final data = await _isaResultApiService.fetchIsaDropDwnDetails(
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

  void getIsaResultDetails(
      {required int action,
      required int mode,
      required int batchClassId,
      required int classBatchSectionId,
      required String fetchId,
      required String userId,
      required double randomNum}) async {
    final data = await _isaResultApiService.fetchIsaResultDetails(
        action: action,
        mode: mode,
        batchClassId: batchClassId,
        classBatchSectionId: classBatchSectionId,
        fetchId: fetchId,
        userId: userId,
        randomNum: randomNum);
    isaResultModel = data;

    notifyListeners();
  }

  void getIsaGraphDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required String fetchId,
      required String subjectCode,
      required String subjectName,
      required String userId,
      required String loginId,
      required double randomNum}) async {
    final data = await _isaResultApiService.fetchIsaGraphDetails(
        action: action,
        mode: mode,
        subjectId: subjectId,
        fetchId: fetchId,
        subjectCode: subjectCode,
        subjectName: subjectName,
        userId: userId,
        loginId: loginId,
        randomNum: randomNum);
    isaGraphModel = data;

    notifyListeners();
  }
}
