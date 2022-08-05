import 'package:flutter/material.dart';
import 'package:pesu/src/courses/api/unitApiService.dart';
import 'package:pesu/src/courses/viewModel/subjectViewModel.dart';

import '../model/unitModel.dart';

class UnitViewModel extends ChangeNotifier {
  final UnitApiService _unitApiService = UnitApiService();
  List<UnitModel>? unitModel;

  void getUnitDetails(
      {required int action,
      required int mode,
      required int subjectId,
      required int ccId,
      required double randomNum}) async {
    final data = await _unitApiService.fetchUnitDetails(
        action: action,
        mode: mode,
        subjectId: subjectId,
        ccId: ccId,
        randomNum: randomNum);
    unitModel = data;

    notifyListeners();
  }
}
