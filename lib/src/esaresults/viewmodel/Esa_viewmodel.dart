import 'package:flutter/cupertino.dart';


import '../api/esa_api.dart';
import '../model/esa_model.dart';


class EsaViewModel extends ChangeNotifier {
  late final EsaApi _apiService = EsaApi();
  List<String> items = ["Sem-1"];
   ESAModel1? esaModel1;
   ESAModel2? esaModel2;
  ESAModel4? esaModel4;

  void  getESAResults(
      {required int action,
        required int mode,
        required String userId,
        required double randomNum,}) async {
    final data = await _apiService.fetchEsaInfoDetails(
        action: action,
        mode: mode,
        userId: userId,
        randomNum: randomNum,);

    esaModel1 = data;
    notifyListeners();
  }

  void  getESAData(
      {required int action,
        required int mode,
        required String userId,
        required double randomNum,}) async {
    final data = await _apiService.fetchEsaSemInfo(
      action: action,
      mode: mode,
      userId: userId,
      randomNum: randomNum,);
  this.items = data?.studentSemesterWise?.map((e) => e.className.toString()).toList() ?? <String>[];
    esaModel2 = data;
    notifyListeners();
  }


  void  getSubjectData(
      {required int action,
        required int mode,
        required String UserId,
        required double randomNum, required int? BatchClassId, required int ClassBatchSectionId, required int ClassessId, required String usn, required int isFinalised, required String ClassName,}) async {
    final data = await _apiService.fetchSubjectInfo(
      action: action,
      mode: mode,
      userId: UserId,
      classBatchSectionId: ClassBatchSectionId,
      batchClassId: BatchClassId,
      classessId: ClassessId,
      className: ClassName,
      isFinalized: isFinalised,
      randomNum: randomNum,);

    esaModel4 = data;
    notifyListeners();
  }
}
