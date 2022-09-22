import 'dart:math';

import 'package:flutter/cupertino.dart';


import '../../../utils/constants/sp_constants.dart';
import '../../../utils/services/sharedpreference_utils.dart';
import '../api/esa_api.dart';
import '../model/esa_model.dart';


class EsaViewModel extends ChangeNotifier {
  late final EsaApi _apiService = EsaApi();
  List<String> items = ["Sem-1"];
   ESAModel1? esaModel1;
   ESAModel2? esaModel2;
  ESAModel4? esaModel4;
  SharedPreferenceUtil preferenceUtil=SharedPreferenceUtil();

  void  getESAResults(
      {required int action,
        required int mode,
        required double randomNum,}) async {
    String? userId=await preferenceUtil.getString(sp_userId);
    final data = await _apiService.fetchEsaInfoDetails(
        action: action,
        mode: mode,
        userId: userId.toString(),
        randomNum: randomNum,);

    esaModel1 = data;
    notifyListeners();
  }

  void  getESAData(
      {required int action,
        required int mode,
        required double randomNum,}) async {
    String? userId=await preferenceUtil.getString(sp_userId);
    final data = await _apiService.fetchEsaSemInfo(
      action: action,
      mode: mode,
      userId: userId.toString(),
      randomNum: randomNum,);
  this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
    esaModel2 = data;
    notifyListeners();
  }


  void  getSubjectData(
      {required int action,
        required int mode,
        required double randomNum, required int ClassBatchSectionId, required int ClassessId, required int isFinalised, required String ClassName, required int BatchClassId,}) async {
    String? UserId=await preferenceUtil.getString(sp_userId);
    String BatchClassId=await preferenceUtil.getString(sp_batchClassId) ?? " ";
     String ClassBatchSectionId=await preferenceUtil.getString(sp_classBatchSectionId) ?? " ";
     String ClassessId=await preferenceUtil.getString(sp_classId) ?? " ";
print("object $BatchClassId");
    final data = await _apiService.fetchSubjectInfo(
      action: action,
      mode: mode,
      userId: UserId.toString(),
      classBatchSectionId: int.parse(ClassBatchSectionId.toString()),
      batchClassId: int.parse(BatchClassId.toString()),
      classessId: int.parse(ClassessId.toString()),
      className: ClassName.toString(),
      isFinalized: isFinalised,
      randomNum: randomNum,);

    esaModel4 = data;
    notifyListeners();
  }
}
